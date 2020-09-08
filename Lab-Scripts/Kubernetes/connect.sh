#!/bin/bash

vagrant ssh $(pwd | awk -F/ '{print $5}')-k8s-master
