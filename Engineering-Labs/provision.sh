#!/bin/bash

# Initialize Cluster

echo "Do you want to make a lab in this directory?"
echo "Please type the name of your lab:"
read LAB
echo "============================== PROVISION PROCESS =============================="
while true; do
    read -p "Do you wish to create a directory lab $LAB in this directory (yes/no)?" yn
    case $yn in
        [Yy]* ) echo "MAKING $LAB DIRECTORY"; \
		mkdir $LAB; \
		echo "COPYING OVER INIT SCRIPTS AND LAB FILES"; \
		sudo cp -r ~/Lab-Scripts/Kubernetes/ $(pwd)/$LAB; \
		echo "CHANGING OWNERSHIP ON FILES TO STO USER FOR $LAB"; \
		#sudo chown -R rbarrett:rbarrett ~/Engineering-Labs/$LAB; \
		echo "============================== PROVISION SUCCESS =============================="; \
                break;; \
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
