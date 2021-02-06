
data "vsphere_datacenter" "dc" {
  name = var.vm_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vm_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vm_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vm_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vm_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "template_file" "deploy-cluster-template" {
  template = file("${path.module}/scripts/deploy-cluster-template")
  vars = {
    ip1        = "${var.vm_cidr}.${(var.vm_start_ip)}"
    ip2        = "${var.vm_cidr}.${(var.vm_start_ip + 1)}"
    ip3        = "${var.vm_cidr}.${(var.vm_start_ip + 2)}"
    admin_user = var.local_admin_user
    admin_pass = var.local_admin_pass
  }
}
