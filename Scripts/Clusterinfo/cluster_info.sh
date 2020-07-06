#!/bin/bash

# Get Number of Cluster Roles
printf "==== Get Cluster Roles ==== \n"
  kubectl get clusterroles --no-headers | wc -l
printf "==== Break for more Info ==== \n"
printf" \n"
# Get Number of Cluster Role Bindings
printf "==== Get Cluster Role Bindings ==== \n"
  kubectl get clusterrolebindings --no-headers | wc -l
printf "==== Break for more Info ==== \n"


