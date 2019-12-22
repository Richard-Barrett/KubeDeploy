#!/bin/bash

# Check for Python requirements.txt 
pip install ~/KubeDeploy/Python/requirements.txt 

# Turn off Swap on server
sudo swapoff -a
sudo vi /etc/fstab

# Edit the line in /etc/fstab that says /root/swap and add a # at the start of that line, so it looks like: #/root/swap

# Install Docker
sudo yum -y install docker
sudo systemctl enable docker
sudo systemctl start docker

# Configure Kubernetes Repository
cat << EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

# Turn off selinux
sudo setenforce 0
sudo vi /etc/selinux/config

# Change the line that says SELINUX=enforcing to SELINUX=permissive and save the file

# Install kubelet, kubeadm, and kubectl
sudo yum install -y kubelet kubeadm kubectl
sudo systemctl enable kubelet
sudo systemctl start kubelet

# Configure firewalld
sudo firewall-cmd --permanent --add-port=10251/tcp
sudo firewall-cmd --permanent --add-port=10255/tcp
firewall-cmd –-reload

# Configure sysctl
cat << EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sudo sysctl --system
