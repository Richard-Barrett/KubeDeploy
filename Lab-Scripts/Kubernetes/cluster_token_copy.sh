#!/bin/bash

# Prepare Join Command
vagrant ssh -c "mkdir -p $HOME/.kube; \
		sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config; \
		sudo chown $(id -u):$(id -g) $HOME/.kube/config; \
                kubeadm token create --print-join-command > /tmp/temp_join_token.txt; \
		cat /tmp/temp_join_token.txt; \
		exit" \
$(pwd | awk -F/ '{print $5}')-k8s-master

# Copy the file within Directory opn Local Host
vagrant scp $(pwd | awk -F/ '{print $5}')-k8s-master:/tmp/temp_join_token.txt .

# Copy the File to Guest Machines
vagrant scp $(pwd)/temp_join_token.txt $(pwd | awk -F/ '{print $5}')-node-1:/home/vagrant
vagrant scp $(pwd)/temp_join_token.txt $(pwd | awk -F/ '{print $5}')-node-2:/home/vagrant

# Delete Token on Local host
rm $(pwd)/temp_join_token.txt
