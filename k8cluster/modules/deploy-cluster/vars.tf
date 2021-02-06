variable "nodeconfig" {
}
variable "dns" {
  description = "dns server ips"
}
variable "network" {
  description = "VM Network switch"
}
variable "ipv4_gateway" {
  description = "default gateway"
}
variable "template" {
  description = "vmware template"
}
variable "domain" {
  description = "vm domain"
}
variable "datacenter" {
  description = "vm domain"
}
variable "datastore" {
  description = "vm domain"
}
variable "cluster" {
  description = "vm domain"
}
variable "resource_pool" {
  description = "vm resource pool"
}
variable "folder" {
  description = "vm folder"
}
variable "anti_affinity_rule_name_mn" {
  description = "Name anti-affinity rule master nodes"
  default     = "K8s-cluster-vm-anti-affinity-rule"
}
variable "anti_affinity_rule_name_wn" {
  description = "Name anti-affinity rule worker nodes"
  default     = "K8s-cluster-vm-anti-affinity-rule"
}
variable "ipv4_netmask" {}
