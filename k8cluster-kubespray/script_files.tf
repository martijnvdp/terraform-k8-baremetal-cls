resource "local_file" "deploy-cluster-script" {
  content  = data.template_file.deploy-cluster-template.rendered
  filename = "${path.module}/scripts/deploy-cluster.sh"
}

resource "local_file" "deploy-cluster-node-script" {
  content  = data.template_file.deploy-cluster-node-template.rendered
  filename = "${path.module}/scripts/deploy-cluster-node.sh"
}

resource "local_file" "add-cluster-to-local-config-template" {
  content  = data.template_file.add-cluster-to-local-config-template.rendered
  filename = "${path.module}/scripts/add-cluster-to-local-config.sh"
}

resource "local_file" "add-cluster-to-local-config-ps-template" {
  content  = data.template_file.add-cluster-to-local-config-ps-template.rendered
  filename = "${path.module}/scripts/add-cluster-to-local-config.ps1"
}
