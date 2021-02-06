#export $env:TF_VAR_ADMIN_USER= user
#export $env:TF_VAR_ADMIN_Pass=pass
variable "ADMIN_PASS" {
  description = "vmware admin password"
}
variable "ADMIN_USER" {
  description = "vmware admin user account"
}
variable "vsphere_server" {
  description = "Virtualcenter server fqdn"
}

variable "vm_dns" {
  description = "dns server ips"
}

variable "vm_network" {
  description = "VM Network switch"
}

variable "vm_netmask" {
  description = "VM Network subnet"
  default     = 24
}


variable "vm_default_gw" {
  description = "default gateway"
}

variable "vm_template" {
  description = "ubuntu vmware template"
}

variable "vm_domain" {
  description = "vm domain"
}

variable "vm_datacenter" {
  description = "vmware datacenter name"
}

variable "vm_datastore" {
  description = "datastore name"
}

variable "vm_cluster" {
  description = "vmware cluster name"
}

variable "vm_resource_pool" {
  description = "vm resource pool name for the cluster"
}

variable "vm_folder" {
  description = "vm folder name"
}

variable "anti_affinity_rule_name" {
  description = "Name anti-affinity rule"
  default     = "K8s-cluster-vm-anti-affinity-rule"
}

variable "local_admin_user" {
  description = "local account nodes"
}

variable "local_admin_pass" {
  description = "local admin password nodes"
}

variable "loadbalancer_iprange" {
  description = "ip range external ips loadbalancer"
  default     = "192.168.1.235-192.168.1.245"
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

variable "masters_prefix" {
  description = "master nodes prefix name"
  default     = "k8master"
}

variable "masters_count" {
  description = "master node count currently max 1 works"
  default     = 1
}

variable "masters_cpu" {
  description = "cpu count master nodes"
  default     = 2
}

variable "masters_memory" {
  description = "Memory master nodes"
  default     = 4096
}

variable "masters_disk" {
  description = "Disk size master nodes in GB"
  default     = 100
}

variable "masters_startip" {
  description = "first ip of the master nodes"
  default     = "192.168.1.210"
}
