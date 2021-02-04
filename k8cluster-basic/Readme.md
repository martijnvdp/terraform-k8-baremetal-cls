example terraform.tfvars
```
vsphere_server       = "vc.dc.local"
vm_name              = "k8node"
vm_dns               = ["8.8.8.8","8.8.4.4"]
vm_start_ip          = 210
vm_network           = "VM Network"
vm_default_gw        = "192.168.1.1"
vm_template          = "UbuntuTemplate"
vm_domain            = "dc.local"
vm_datacenter        = "dc"
vm_datastore         = "vsanDatastore"
vm_cluster           = "CLS"
vm_resource_pool     = "k8cluster"
vm_folder            = "folder"
vm_cidr              = "192.168.1"
vm_count             = 3
local_admin_user     = "ubuntu"
local_admin_pass     = "ubuntu"
loadbalancer_iprange = "192.168.10.235-192.168.10.245"
```
