#!/bin/bash

# Update the system and install common packages
echo "Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

#installing nano
sudo apt install nano
echo "successfully installed nano"

