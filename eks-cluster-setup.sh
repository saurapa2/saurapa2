#!/bin/bash

# Check if the cluster name and AWS region are provided as arguments
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <cluster-name> <aws-region>"
  exit 1
fi

# Set the cluster name and AWS region from the arguments
CLUSTER_NAME=$1
AWS_REGION=$2

# Remove existing EKS configuration
rm -rf ~/.kube/config

# Set AWS region
export AWS_DEFAULT_REGION=$AWS_REGION

# Set Kubeconfig path
export KUBECONFIG=~/.kube/config

# Update kubeconfig for the specified EKS cluster
aws eks update-kubeconfig --kubeconfig ~/.kube/config --name $CLUSTER_NAME

# Get cluster info
kubectl cluster-info