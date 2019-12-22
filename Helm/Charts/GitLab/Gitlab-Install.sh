#!/bin/bash

# Add gitlab repository
helm repo add gitlab https://charts.gitlab.io/

# Install Chart
helm install gitlab/gitlab --version 2.5.6
