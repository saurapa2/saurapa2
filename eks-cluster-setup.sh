#!/bin/bash

# Check if the cluster name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <cluster-name>"
  exit 1
fi

# Set the cluster name from the first argument
CLUSTER_NAME=$1

# Remove existing EKS configuration
rm -rf ~/.kube/eks

# Set AWS region
export AWS_DEFAULT_REGION=us-west-2

# Set Kubeconfig path
export KUBECONFIG=~/.kube/eks

# Update kubeconfig for the specified EKS cluster
aws eks update-kubeconfig --kubeconfig ~/.kube/eks --name $CLUSTER_NAME

# Add any additional commands below
# For example, you can add a command to get cluster info
kubectl cluster-info