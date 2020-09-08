#!/bin/bash

vagrant destroy $(pwd | awk -F/ '{print $5}')-k8s-master -f
vagrant destroy $(pwd | awk -F/ '{print $5}')-node-1 -f
vagrant destroy $(pwd | awk -F/ '{print $5}')-node-2 -f

