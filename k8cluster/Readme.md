# Deploy k8cluster with ubuntu vms #
```
1. create terraform.tfvars see example
2. terraform init
3. terraform apply
4. user output token with the add-cluster-to-local-config script to add the cluster to kubeconfig with the admin service account

powershell
powershell -file scripts\add-cluster-to-local-config.ps1 
enter token from the terraform output

shell: 
.\scripts\add-cluster-to-local-config.sh 
ennter token from output

5. check connection with 
kubectl get svc
```


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

