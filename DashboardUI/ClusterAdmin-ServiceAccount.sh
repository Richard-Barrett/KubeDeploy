#!/bin/bash


# You can create a service account with cluster-admin role that will have access to all your resources
kubectl create serviceaccount cluster-admin-dashboard-sa
kubectl create clusterrolebinding cluster-admin-dashboard-sa \
  --clusterrole=cluster-admin \
  --serviceaccount=default:cluster-admin-dashboard-sa
  
# Copy the token from the generated secret
kubectl get secret | grep cluster-admin-dashboard-sa >> admin_generated.txt

# Redirect the Admin Token into admin_token.txt
kubectl describe secret cluster-admin-dashboard-sa-token-6xm8l >> admin_token.txt

# Create limited resources access service account
kubectl create serviceaccount pod-viewer
kubectl apply -f ~/KubeDeploy/DashboardUI/Resources/pod-viewer-role.yaml
kubectl create clusterrolebinding pod-viewer-sa \
  --clusterrole=pod-viewer \
  --serviceaccount=default:pod-viewer-sa
  
# Copy the token for the limited resources access service account into user_limited.txt
kubectl get secret | grep pod-viewer >> user_limited.txt


