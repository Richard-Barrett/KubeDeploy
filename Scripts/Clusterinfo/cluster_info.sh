#!/bin/bash

# Get Cluster Roles
printf "==== Get Cluster Roles ==== \n"
  kubectl get clusterroles --no-headers | wc -l
printf "==== Break for more Info ==== \n"
