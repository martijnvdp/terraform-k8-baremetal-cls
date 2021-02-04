# terraform


## k8cluster ##
Terraform code to deploy a centos8 kubernetes cluster on vmware using ansible and terraform

playbook from https://github.com/kubernetes-sigs/kubespray

ansible fixed at 2.9.14 to fix \
ERROR! 'dict object' has no attribute 'pkg_mgr' \
https://github.com/kubernetes-sigs/kubespray/issues/6762
