kubectl -n games apply -f https://raw.githubusercontent.com/paolomainardi/additronk8s-retrogames-kubernetes-controller/main/k8s/manifests/namespace.yml
kubectl -n games apply -f https://raw.githubusercontent.com/paolomainardi/additronk8s-retrogames-kubernetes-controller/main/k8s/manifests/crd-game-controller.yml
kubectl -n games apply -f https://raw.githubusercontent.com/paolomainardi/additronk8s-retrogames-kubernetes-controller/main/k8s/manifests/game-controller-cluster-role-binding.yml
kubectl -n games apply -f https://raw.githubusercontent.com/paolomainardi/additronk8s-retrogames-kubernetes-controller/main/k8s/manifests/game-controller-cluster-role.yml
kubectl -n games apply -f https://raw.githubusercontent.com/paolomainardi/additronk8s-retrogames-kubernetes-controller/main/k8s/manifests/game-controller-sa.yml
kubectl -n games apply -f https://raw.githubusercontent.com/paolomainardi/additronk8s-retrogames-kubernetes-controller/main/k8s/manifests/game-controller.yaml
kubectl -n games apply -f ./demos/retrogames/monkeyisland.yaml
kubectl -n games apply -f ./demos/retrogames/monkeyisland-istio-ingress.yaml