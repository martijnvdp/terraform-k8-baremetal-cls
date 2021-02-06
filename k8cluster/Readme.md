example terraform.tfvars
```
vsphere_server       = "vc.dc.local"
vm_name              = "k8node"
vm_dns               = ["8.8.8.8","8.8.4.4"]
vm_network           = "VM Network"
vm_default_gw        = "192.168.1.1"
vm_template          = "UbuntuTemplate"
vm_domain            = "dc.local"
vm_datacenter        = "dc"
vm_datastore         = "vsanDatastore"
vm_cluster           = "CLS"
vm_resource_pool     = "k8cluster"
vm_folder            = "folder"
vm_count             = 3
local_admin_user     = "ubuntu"
local_admin_pass     = "ubuntu"
loadbalancer_iprange = "192.168.1.235-192.168.1.245"

workers_prefix  = "k8node"
workers_count   = 3
workers_cpu     = 2
workers_memory  = 4096
workers_disk    = 100
workers_startip = 192.168.1.211

masters_prefix  = "k8master"
masters_count   = 1
masters_cpu     = 2
masters_memory  = 4096
masters_disk    = 100
masters_startip = 192.168.1.210

```

## Usage ##
on linux: 
```
terraform init
terraform plan
.\scripts\add-cluster-to-local-config.sh \\enter token from output
```
