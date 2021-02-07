kubectl create namespace sock-shop
kubectl apply -f $PSScriptRoot/../demos/sock-shop/complete-sock-shop.yaml
kubectl apply -f $PSScriptRoot/../demos/sock-shop/istio-sockshop-gateway.yaml -n sock-shop
kubectl apply -f $PSScriptRoot/../demos/sock-shop/istio-sockshop-virtualservices.yaml -n sock-shop
$sock_fqdn = read-host "Type FQDN for monkeyisland ingress, * for all"
@"
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: sockshop-gateway
  namespace: sock-shop
spec:
  selector:
    istio: ingressgateway
  servers:
  - port:
      number: 80
      name: sockshop-http
      protocol: HTTP
    hosts:
    - "$sock_fqdn"
"@| out-file $psscriptroot/../demos/sock-shop/sockshop-gateway.yaml
kubectl -n sock-shop apply -f $psscriptroot/../demos/sock-shop/sockshop-gateway.yaml
