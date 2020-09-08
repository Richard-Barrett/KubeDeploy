#!/bin/bash
NAME=$(pwd | awk -F/ '{print $5}')

# Login to Master and Change Roles and Label Worker nodes
vagrant ssh -c "kubectl label node $NAME-node-1 node-role.kubernetes.io/worker=$NAME-worker-1; \
		kubectl label node $NAME-node-2 node-role.kubernetes.io/worker=$NAME-worker-2; \
		" \
$NAME-k8s-master
