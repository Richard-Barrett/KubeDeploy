#!/bin/bash

# 
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > install-helm.sh

# Change Script Permissions
chmod u+x install-helm.sh

# Run Script 
./install-helm.sh

# Set up Service Account and Create Cluster Role for Tiller
kubectl -n kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller

# Initialize Helm
helm init --service-account tiller

# Verify Pods
kubectl get pods --namespace kube-system

# Install Kubernetes Dashboard
helm install stable/kubernetes-dashboard --name dashboard-demo

# List Helm and Get Kube Services
helm list
kubectl get services

# Interactively Choose to Upgrade Dasboard and Rename
helm upgrade dashboard-demo stable/kubernetes-dashboard --set fullnameOverride="dashboard"

# Run Dashboard as Backgroun Process
kubectl proxy & 
