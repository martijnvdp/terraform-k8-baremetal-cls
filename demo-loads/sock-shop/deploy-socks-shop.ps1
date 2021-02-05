kubectl create namespace sock-shop
kubectl apply -f $PSScriptRoot/complete-sock-shop.yaml
kubectl apply -f $PSScriptRoot/istio-sockshop-gateway.yaml -n sock-shop
kubectl apply -f $PSScriptRoot/istio-sockshop-virtualservices.yaml -n sock-shop