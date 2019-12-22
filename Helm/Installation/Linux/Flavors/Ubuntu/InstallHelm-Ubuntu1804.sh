#!/bin/bash

# Install Helm
curl -L https://git.io/get_helm.sh | bash

# Create Resources
kubectl apply -f ~/KubeDEploy/Helm/helm-rbac.yaml
