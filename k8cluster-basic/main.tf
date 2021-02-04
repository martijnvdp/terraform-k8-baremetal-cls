provider "vsphere" {
  user                 = var.ADMIN_USER
  password             = var.ADMIN_PASS
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}
