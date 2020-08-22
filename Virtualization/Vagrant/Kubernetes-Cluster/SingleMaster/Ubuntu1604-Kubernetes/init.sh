#!/bin/bash

# Initialize Cluster
vagrant up

# Need Error Cathing on SSH Timeout Hangs and Cleanup

# Prepare Join Command
vagrant ssh -c "kubeadm token create --print-join-command >> /tmp/temp_join_token.txt; \
		cat /tmp/temp_join_token.txt; \
		exit" \
$(pwd | awk -F/ '{print $5}')-k8s-master

# Copy the file within Directory opn Local Host
vagrant scp $(pwd | awk -F/ '{print $5}')-k8s-master:/tmp/temp_join_token.txt .

# Copy the File to Guest Machines
vagrant scp $(pwd)/temp_join_token.txt node-1:/home/vagrant
vagrant scp $(pwd)/temp_join_token.txt node-2:/home/vagrant

# Delete Token on Local host
rm $(pwd | awk -F/ '{print $5}')/temp_join_token.txt .

# Join Worker Nodes
# Join  Worker Node-1
#vagrant ssh -c "echo 'Joining Worker Node-1'; \
#		pwd; \
#		sudo cp /home/vagranttemp_join_token.txt /root/temp_join_token.txt; \
#		join=$(cat /root/temp_join_token.txt); \
#		printf "Join Token Used \n"; \
#		echo $join; \
#		sudo $join; \
#		echo 'Node Worker Joined'; \
#		exit"
#$(pwd | awk -F/ '{print $5}')-node-1

# Join Worker Node-2
#vagrant ssh -c "echo 'Joining Worker Node-2'; \
#                pwd; \
#  		 su -c root whoami; \
#                su -c root cp /home/vagranttemp_join_token.txt /root/temp_join_token.txt; \
#                su -c root join=$(cat /root/temp_join_token.txt); \
#                su -c root printf "Join Token Used as Root \n"; \
#                su -c root echo $join; \
#                su -c root $join; \
#                su -c root echo 'Node Worker Joined'; \
#		 su -c root echo 'Deleting Join Token'; \
# 		 su -c root rm /root/temp_join_token.txt
#                exit"
#node-2

# Rename Node Roles for Worker Node 1 & 2
#vagrant ssh -c "kubectl label node $(pwd | awk -F/ '{print $5}')-node-1 node-role.kubernetes.io/master=worker-1; \
#		exit" \
#$(pwd | awk -F/ '{print $5}')-k8s-master
