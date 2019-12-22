#!/bin/bash

# Install Requirements


# Turn Swap Off 
sudo swapoff -a

# Look for the line in /etc/fstab that says /root/swap and add a 
# At the start of that line, so it looks like: #/root/swap. Then save the file.
# Place in component that does this dynamically


# Install Requirements
sudo dnf -y install docker
sudo systemctl enable docker
sudo systemctl start docker

# Add the Kubernetes Repository to /etc/yum.repos.d/kubernetes.repo
cat << EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

# Install Kubelet, Kubeadm, Kubectl 
sudo dnf install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
sudo systemctl enable --now kubelet

# Configure Sysctl
cat << EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sudo sysctl --system

# Initialize the Kube Master and Save the Admin Join Command to admin_join_command.txt
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 >> admin_join_command.txt
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
