#!/bin/bash

vagrant halt $(pwd | awk -F/ '{print $5}')-k8s-master
vagrant halt $(pwd | awk -F/ '{print $5}')-node-1
vagrant halt $(pwd | awk -F/ '{print $5}')-node-2
