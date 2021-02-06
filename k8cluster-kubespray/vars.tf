#export $env:TF_VAR_ADMIN_USER= user
#export $env:TF_VAR_ADMIN_Pass=pass
variable "ADMIN_PASS" {}
variable "ADMIN_USER" {}
variable "vsphere_server" {
  description = "virtual center server FQDN"
}
variable "vm_dns" {
  description = "dns server ips"
}
variable "vm_start_ip" {
  description = "start ip range ,example 192.168.1.10"
}
variable "vm_network" {
  description = "VM Network switch"
}
variable "vm_default_gw" {
  description = "default gateway"
}
variable "vm_template" {
  description = "vmware template"
}
variable "vm_domain" {
  description = "vm domain"
}
variable "vm_datacenter" {
  description = "vm domain"
}
variable "vm_datastore" {
  description = "vm domain"
}
variable "vm_cluster" {
  description = "vm domain"
}
variable "vm_resource_pool" {
  description = "vm resource pool"
}
variable "vm_folder" {
  description = "vm folder"
}

variable "loadbalancer_iprange" {
  description = "ip range external ips loadbalancer"
  default     = "192.168.1.235-192.168.1.245"
}

variable "anti_affinity_rule_name" {
  description = "Name anti-affinity rule"
  default     = "K8s-cluster-vm-anti-affinity-rule"
}
variable "local_admin_user" {
  description = "local account nodes"
}
variable "local_admin_pass" {
  description = "local admin pass nodes"
}

variable "workers_prefix" {
  default = "k8node"
}

variable "workers_count" {
  default = 3
}

variable "workers_cpu" {
  default = 2
}

variable "workers_memory" {
  default = 4096
}

variable "workers_disk" {
  default = 100
}

variable "workers_startip" {
  default = "192.168.1.211"
}
