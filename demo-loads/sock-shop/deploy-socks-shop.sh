#!/bin/sh
SR="`dirname \"$0\"`"
kubectl create namespace sock-shop
kubectl apply -f $SR/complete-sock-shop.yaml
kubectl apply -f $SR/istio-sockshop-gateway.yaml -n sock-shop
kubectl apply -f $SR/istio-sockshop-virtualservices.yaml -n sock-shop