#!/bin/bash
set -e 

# Timeout Error for SSH on Vagrantfile
TIMEOUT=$(echo "Timed out")
MASTER=$(pwd | awk -F/ '{print $5}')-k8s-master
NODE_1=$(pwd | awk -F/ '{print $5}')-node-1
NODE_2=$(pwd | awk -F/ '{print $5}')-node-2

# Set CWD Variable for Sed Vagrantfile Replacement
CWD=$(pwd | awk -F/ '{print $5}')
echo $CWD
sudo sed 's,<insert_first_initial_last_name_as_one_string_lowercases>,'"$CWD"',g' Vagrantfile >> Vagrantfile_1
sudo rm Vagrantfile  
sudo mv Vagrantfile_1 Vagrantfile

echo "Please choose a Number in the format of XX using [0-9]."
read IP_replacement
while true; do
    read -p "You will write out $IP_replacement into Vagrantfile? (yes/no)?" yn
    case $yn in 
        [Yy]* ) sudo sed 's,<insert_IP_string_not_in_use>,'"$IP_replacement"',g' Vagrantfile >> Vagrantfile_2; \
		sudo rm Vagrantfile; \
		sudo mv Vagrantfile_2 Vagrantfile; \
		sudo sed 's,<insert_IP_string_not_in_use>,'"$IP_replacement"',g' $(pwd)/kubernetes-setup/master-playbook.yml >> $(pwd)/kubernetes-setup/masterplaybook.yml; \
		sudo rm $(pwd)/kubernetes-setup/master-playbook.yml; \
		sudo mv $(pwd)/kubernetes-setup/masterplaybook.yml $(pwd)/kubernetes-setup/master-playbook.yml; \
        	break;; \
	[Nn]* ) exit;;
	* ) echo "Please answer yes or no.";;
    esac 
done


# Initialize Cluster
while true; do
    read -p "Do you wish to initialize the cluster in $pwd (yes/no)?" yn
    case $yn in
        [Yy]* ) vagrant up; \
#		if (($TIMEOUT=TRUE)); 
#			then vagrant destroy $MASTER -f;
#				vagrant up $MASTER; 
#		elif (($TIMEOUT=TRUE)); 
#			then vagrant destroy $NODE_1 -f;
#				vagrant up $NODE_1;
#		elif (($TIMEOUT=TRUE));
#			then vagrant destroy $NODE_2 -f;
#				vagrant up $NODE_2;
#		else (($TIMEOUT=FALSE));
#			echo "Nodes Provisioned and Cluster Status READY";
#		fi
		break;; \
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


# Need Error Cathing on SSH Timeout Hangs and Cleanup

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
