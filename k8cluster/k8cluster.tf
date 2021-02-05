#Virtual Machine Resource
resource "vsphere_virtual_machine" "vm" {
  count            = var.vm_count
  name             = "${var.vm_name}-${count.index + 1}"
  folder           = var.vm_folder
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 4096
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type
  firmware  = "efi"

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label = "${var.vm_name}-${count.index + 1}-disk0"
    size  = 100
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "${var.vm_name}-${count.index + 1}"
        domain    = var.vm_domain
      }
      network_interface {
        ipv4_address = "${var.vm_cidr}.${(var.vm_start_ip + count.index)}"
        ipv4_netmask = 24
      }
      ipv4_gateway    = var.vm_default_gw
      dns_server_list = var.vm_dns
    }
  }
}
resource "vsphere_compute_cluster_vm_anti_affinity_rule" "cluster_vm_anti_affinity_rule" {
  name                = var.anti_affinity_rule_name
  compute_cluster_id  = data.vsphere_compute_cluster.cluster.id
  virtual_machine_ids = [for k, v in vsphere_virtual_machine.vm : v.id]
}
resource "null_resource" "prep_nodes" {
  count = length(vsphere_virtual_machine.vm) - 1
  provisioner "file" {
    source      = local_file.deploy-cluster-node-script.filename
    destination = "/tmp/deploy-cluster-node.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/deploy-cluster-node.sh",
      "sudo /tmp/deploy-cluster-node.sh",
    ]
  }
  connection {
    type     = "ssh"
    user     = var.local_admin_user
    password = var.local_admin_pass
    host     = tostring(vsphere_virtual_machine.vm[count.index + 1].default_ip_address)
  }
  triggers = {
    "after" = vsphere_compute_cluster_vm_anti_affinity_rule.cluster_vm_anti_affinity_rule.id
  }
}
resource "null_resource" "create_cluster" {
  provisioner "file" {
    source      = local_file.deploy-cluster-script.filename
    destination = "/tmp/deploy-cluster.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/deploy-cluster.sh",
      "sudo /tmp/deploy-cluster.sh",
    ]
  }
  connection {
    type     = "ssh"
    user     = var.local_admin_user
    password = var.local_admin_pass
    host     = tostring(vsphere_virtual_machine.vm[0].default_ip_address)
  }
  triggers = {
    "after" = vsphere_compute_cluster_vm_anti_affinity_rule.cluster_vm_anti_affinity_rule.id
  }
}

resource "null_resource" "addtoconfig" {
  provisioner "local-exec" {
    command = "sudo chmod +x ${path.module}/scripts/add-cluster-to-local-config.sh"
  }
  triggers = {
    "after" = null_resource.create_cluster.id
  }
}
