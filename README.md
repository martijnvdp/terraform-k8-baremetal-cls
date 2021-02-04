# terraform

## k8cluster-ubuntu ##
Working auto deployment kubernetes cluster on vmware with ubuntu vms \
using terraform and shell scripts 
- metallb loadbalancer

## k8cluster-kubespray ##
Terraform code to deploy a centos8 kubernetes cluster on vmware using ansible and terraform

playbook from https://github.com/kubernetes-sigs/kubespray

ansible fixed at 2.9.14 to fix \
ERROR! 'dict object' has no attribute 'pkg_mgr' \
https://github.com/kubernetes-sigs/kubespray/issues/6762


## addons ##

grafana
```
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/grafana.yaml
```
kiali
```
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/kiali.yaml
```
jaeger
```
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/jaeger.yaml
```
prometheus
```
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/prometheus.yaml
```
zipkin
```
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/extras/zipkin.yaml
```
cert manager
```
https://github.com/jetstack/cert-manager
```
## demo load ##

Socks microservices
```
https://github.com/microservices-demo/microservices-demo
```
bookinfo
```
https://istio.io/latest/docs/examples/bookinfo/
```