#!/bin/sh
SR="`dirname \"$0\"`"
kubectl create namespace sock-shop
kubectl apply -f $SR/../demos/sock-shop/complete-sock-shop.yaml
kubectl apply -f $SR/../demos/sock-shop/istio-sockshop-gateway.yaml -n sock-shop
kubectl apply -f $SR/../demos/sock-shop/istio-sockshop-virtualservices.yaml -n sock-shop