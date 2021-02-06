# k8 cluster deployment scripts

## k8cluster ##

Working basic bare metal autodeployment of a kubernetes cluster on vmware with ubuntu vms \
using terraform and shell scripts 

- metallb loadbalancer


## k8cluster-kubespray ##
Terraform code to deploy akubernetes cluster on vmware using kubespray ansible playboom and terraform \
HA cluster multiple master nodes with etcd

more info:
playbook from https://github.com/kubernetes-sigs/kubespray

ansible fixed at 2.9.14 to fix \
ERROR! 'dict object' has no attribute 'pkg_mgr' \
https://github.com/kubernetes-sigs/kubespray/issues/6762


## Demo workloads ##

Install demo workload in the k8 cluster

### Socks webshop - microservices ###
```
1. install istio in the k8 cluster
istioctl install
2. install socks shop
powershell -file ../demo-loads/sock-shop/deploy-socks-shop.ps1
3. install addon like kiala console see addon section
run it with: istioctl dashboard kiala

https://github.com/martijnxd/terraform-k8-baremetal-cls/tree/main/demo-loads/sock-shop
source:
https://github.com/microservices-demo/microservices-demo
```
### Bookinfo ###
```
https://istio.io/latest/docs/examples/bookinfo/
```

fortio load generator
```
go get fortio.org/fortio
https://github.com/fortio/fortio

fortio load -c 32 -qps 25 -t 30s http://sockshop.local/
```

### Retro dos games :monkey island ###

run old dos games in kubernetes \
https://github.com/paolomainardi/additronk8s-retrogames-kubernetes-controller

example monkeyisland:

```
1. in a working k8 cluster
2. powershell -file scripts\deploy-monkeyisland.ps1
3. kubectl -n games port-forward svc/monkeyisland 8080:8080 8081:8081
4. http://localhost:8080/

```
## addons ##
```
grafana: \
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/grafana.yaml
kiali: \
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/kiali.yaml
jaeger: \
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/jaeger.yaml
prometheus: \
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/prometheus.yaml
zipkin: \
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/extras/zipkin.yaml
cert manager: \
https://github.com/jetstack/cert-manager
```

## Refs ##
```
https://github.com/jetstack/cert-manager
https://metallb.universe.tf/
https://istio.io/
https://github.com/kubernetes-sigs/kubespray
https://github.com/projectcalico/calico
https://github.com/rancher
https://github.com/paolomainardi/additronk8s-retrogames-kubernetes-controller
https://dosgames.com/
```
