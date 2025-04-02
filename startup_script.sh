#!/bin/bash

# Update the system and install essential packages
echo "Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install necessary utilities (including apt-transport-https)
echo "Installing curl, wget, nano, apt-transport-https, and other dependencies..."
sudo apt-get install -y \
  curl \
  wget \
  nano \
  gnupg2 \
  lsb-release \
  ca-certificates \
  software-properties-common \
  apt-transport-https

# Install Docker (latest stable version)
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu

# Install K3s (lightweight Kubernetes)
echo "Installing K3s..."
curl -sfL https://get.k3s.io | sh -
sudo systemctl enable k3s
sudo systemctl start k3s

# Install Node.js (latest stable version)
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Helm (latest stable version)
echo "Installing Helm..."
sudo curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
sudo chmod 700 get_helm.sh
sudo ./get_helm.sh
sudo apt-get update
sudo apt-get install -y helm

# Verify installations
echo "Verifying installations..."

# Docker
docker --version

# K3s
k3s --version

# Node.js
node -v
npm -v

# Helm
helm version

# Clean up
echo "Cleaning up..."
sudo apt-get autoremove -y
sudo apt-get clean

echo "Startup script completed successfully!"
