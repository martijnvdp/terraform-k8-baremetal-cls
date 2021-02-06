#Virtual Machine Resource

module "deploy-cluster" {
  source        = "./modules/deploy-cluster"
  folder        = var.vm_folder
  resource_pool = var.vm_resource_pool
  datastore     = var.vm_datastore
  datacenter    = var.vm_datacenter
  cluster       = var.vm_cluster
  template      = var.vm_template
  domain        = var.vm_domain
  ipv4_netmask  = 24
  ipv4_gateway  = var.vm_default_gw
  dns           = var.vm_dns
  network       = var.vm_network
  nodeconfig = {
    "worker_nodes" = {
      "prefix"  = var.workers_prefix,
      "count"   = var.workers_count,
      "cpu"     = var.workers_cpu ,
      "memory"  = var.workers_memory,
      "disk"    = var.workers_disk,
      "startip" = var.workers_startip,
    },
    "master_nodes" = {
      "prefix"  = var.masters_prefix,
      "count"   = var.masters_count,
      "cpu"     = var.masters_cpu,
      "memory"  = var.masters_memory,
      "disk"    = var.masters_disk,
      "startip" = var.masters_startip,
    }
  }
}

resource "null_resource" "prep_nodes" {
  count = length(module.deploy-cluster.cluster.worker_nodes_ips)
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
    host     = module.deploy-cluster.cluster.worker_nodes_ips[count.index]
  }
}

resource "null_resource" "create_cluster" {
  count = length(module.deploy-cluster.cluster.master_nodes_ips)
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
    host     = module.deploy-cluster.cluster.master_nodes_ips[count.index]
  }
}
