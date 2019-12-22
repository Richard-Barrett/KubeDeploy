#!/bin/bash

# Download the nginx-ingress helm chart from the public github helm chart repo
helm install stable/nginx-ingress --name nginx-ingress

# Check Install Success
helm ls
