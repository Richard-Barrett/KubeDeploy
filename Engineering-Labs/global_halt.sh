#!/bin/bash

# Set Nodes to Variables
#KUBE_NODES=$(vagrant global-status | grep -i "kube" | grep -v -- "kubeadm" | awk '{print $1}')
#DESTROY=$(for i in $(vagrant global-status | grep -i "kube" | grep -v -- "kubeadm" | awk '{print $1}'); do vagrant destroy $i -f; done)
#HALT=$(for i in $(vagrant global-status | grep -i "kube" | grep -v -- "kubeadm" | awk '{print $1}'); do vagrant halt $i; done)
#SUSPEND=$(for i in $(vagrant global-status | grep -i "kube" | grep -v -- "kubeadm" | awk '{print $1}'); do vagrant suspend $i; done)

while true; do
    read -p "Do you wish to clean up the entire environment and destroy all Vagrant VMs (yes/no)?" yn
    case $yn in
        [Yy]* ) KUBE_NODES=$(vagrant global-status | grep -i "kube" | grep -v -- "kubeadm" | awk '{print $1}'); \
		HALT=$(for i in $(vagrant global-status | grep -i "kube" | grep -v -- "kubeadm" | awk '{print $1}'); do vagrant halt $i; done); \
		break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
