#!/bin/sh
kubectl create namespace sock-shop
kubectl apply -f ./complete-sock-shop.yaml
kubectl apply -f ./istio-sockshop-gateway.yaml -n sock-shop
kubectl apply -f ./istio-sockshop-virtualservices.yaml -n sock-shop