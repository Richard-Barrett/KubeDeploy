#!/bin/bash

# Set Nodes to Variables
#KUBE_NODES=$(vagrant global-status | grep -i "kube" | grep -v -- "kubeadm" | awk '{print $1}')
#DESTROY=$(for i in $(vagrant global-status | grep -i "kube" | grep -v -- "kubeadm" | awk '{print $1}'); do vagrant destroy $i -f; done)

while true; do
    read -p "Do you wish to clean up the entire environment and destroy all Vagrant VMs (yes/no)?" yn
    case $yn in
        [Yy]* ) KUBE_NODES=$(vagrant global-status | grep -i "kube" | grep -v -- "kubeadm" | awk '{print $1}'); \
		DESTROY=$(for i in $(vagrant global-status | grep -i "kube" | grep -v -- "kubeadm" | awk '{print $1}'); do vagrant destroy $i -f; done); \
		break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
