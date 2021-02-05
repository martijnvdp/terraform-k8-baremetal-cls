
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
    ip1                  = vsphere_virtual_machine.vm[0].default_ip_address
    ip2                  = vsphere_virtual_machine.vm[1].default_ip_address
    ip3                  = vsphere_virtual_machine.vm[2].default_ip_address
    loadbalancer_iprange = var.loadbalancer_iprange
    admin_user           = var.local_admin_user
    admin_pass           = var.local_admin_pass
  }
}

data "template_file" "deploy-cluster-node-template" {
  template = file("${path.module}/scripts/deploy-cluster-node-template")
  vars = {
    admin_user = var.local_admin_user
    admin_pass = var.local_admin_pass
  }
}
data "template_file" "add-cluster-to-local-config-template" {
  template = file("${path.module}/scripts/add-cluster-to-local-config-template")
  vars = {
    clustername  = "k8cluster"
    api-endpoint = vsphere_virtual_machine.vm[0].default_ip_address
  }
}

data "template_file" "add-cluster-to-local-config-ps-template" {
  template = file("${path.module}/scripts/add-cluster-to-local-config-ps-template")
  vars = {
    clustername  = "k8cluster"
    api-endpoint = vsphere_virtual_machine.vm[0].default_ip_address
  }
}