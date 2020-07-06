#!/bin/bash

# Check Kubernetes Structure on /etc/kubernetes
directories=(ls -la /etc/kubernetes/ | awk '{print $9}' | tail -n +4)

declare -A directory_structure 
directory_structure=( \
  ["admin.conf"] \
  ["controller-manager.conf"] \
  ["kubelet.conf"] \
  ["manifests"] \
  ["pki"] \
  ["scheduler.conf"] \
  )

echo $directories

# ADD IN INTEGRITY IF STATEMENTS BASED OFF OF DIRECTORY DICTIONARY
