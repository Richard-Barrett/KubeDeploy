#!/bin/bash

# Login to Master and Change Roles and Label Worker nodes
vagrant ssh -c "kubectl label node node-1 node-role.kubernetes.io/master=worker-1; \
		            kubectl label node node-2 node-role.kubernetes.io/master=worker-2; \
		"
k8s-master
