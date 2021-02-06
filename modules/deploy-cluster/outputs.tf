output "cluster" {
  value = {
    worker_nodes_ips = vsphere_virtual_machine.worker_nodes.*.default_ip_address
    master_nodes_ips = vsphere_virtual_machine.master_nodes.*.default_ip_address
  }
}
