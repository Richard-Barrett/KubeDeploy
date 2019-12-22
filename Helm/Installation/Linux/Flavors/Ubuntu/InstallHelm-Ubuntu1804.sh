#!/bin/bash

# Install Helm
curl -L https://git.io/get_helm.sh | bash

# Create Resources
kubectl apply -f ~/KubeDEploy/Helm/helm-rbac.yaml

# For Specific Helm-Tiller Version
# helm init --service-account=tiller --tiller-image=gcr.io/kubernetes-helm/tiller:v2.14.1   --history-max 300
# Initialize Helm: Deploy Tiller
helm init --service-account=tiller --history-max 300
