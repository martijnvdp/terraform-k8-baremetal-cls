data "template_file" "deploy-cluster-template" {
  template = file("${path.module}/scripts/deploy-cluster-template")
  vars = {
    master_nodes         = join(";", module.deploy-cluster.cluster.master_nodes_ips)
    worker_nodes         = join(";", module.deploy-cluster.cluster.worker_nodes_ips)
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
    api-endpoint = module.deploy-cluster.cluster.master_nodes_ips[0]
  }
}

data "template_file" "add-cluster-to-local-config-ps-template" {
  template = file("${path.module}/scripts/add-cluster-to-local-config-ps-template")
  vars = {
    clustername  = "k8cluster"
    api-endpoint = module.deploy-cluster.cluster.master_nodes_ips[0]
  }
}
