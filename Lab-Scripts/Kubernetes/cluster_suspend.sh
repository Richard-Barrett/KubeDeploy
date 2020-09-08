#!/bin/bash

vagrant suspend $(pwd | awk -F/ '{print $5}')-k8s-master
vagrant suspend $(pwd | awk -F/ '{print $5}')-node-1
vagrant suspend $(pwd | awk -F/ '{print $5}')-node-2
