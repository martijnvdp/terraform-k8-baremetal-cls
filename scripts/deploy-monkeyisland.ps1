kubectl -n games apply -f https://raw.githubusercontent.com/paolomainardi/additronk8s-retrogames-kubernetes-controller/main/k8s/manifests/namespace.yml
kubectl -n games apply -f https://raw.githubusercontent.com/paolomainardi/additronk8s-retrogames-kubernetes-controller/main/k8s/manifests/crd-game-controller.yml
kubectl -n games apply -f https://raw.githubusercontent.com/paolomainardi/additronk8s-retrogames-kubernetes-controller/main/k8s/manifests/game-controller-cluster-role-binding.yml
kubectl -n games apply -f https://raw.githubusercontent.com/paolomainardi/additronk8s-retrogames-kubernetes-controller/main/k8s/manifests/game-controller-cluster-role.yml
kubectl -n games apply -f https://raw.githubusercontent.com/paolomainardi/additronk8s-retrogames-kubernetes-controller/main/k8s/manifests/game-controller-sa.yml
kubectl -n games apply -f https://raw.githubusercontent.com/paolomainardi/additronk8s-retrogames-kubernetes-controller/main/k8s/manifests/game-controller.yaml
$monkey_fqdn = read-host "Type FQDN for monkeyisland ingress, * for all"
@"
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: monkeyisland-gateway
  namespace: games
spec:
  selector:
    istio: ingressgateway
  servers:
  - port:
      number: 80
      name: monkeyisland-http
      protocol: HTTP
    hosts:
    - "$monkey_fqdn"
---
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: monkeyisland
  namespace: games
spec:
  hosts:
  - "*"
  gateways:
  - monkeyisland-gateway
  http:
  - route:
    - destination:
        host: monkeyisland
        port: 
          number: 8080
---
apiVersion: networking.istio.io/v1beta1
kind: DestinationRule
metadata:
  name: monkeyisland
  namespace: games
spec:
  host: monkeyisland
"@| out-file $psscriptroot/../demos/retrogames/monkeyisland-istio.yaml
kubectl -n games apply -f $psscriptroot/../demos/retrogames/monkeyisland-istio.yaml
kubectl -n games apply -f $psscriptroot/../demos/retrogames/monkeyisland.yaml
