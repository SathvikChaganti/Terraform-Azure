#!/bin/bash

# Update package repositories
sudo apt-get update

# Install required packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package repositories again
sudo apt-get update

# Install Docker Engine
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add your user to the 'docker' group to avoid using 'sudo' with Docker commands
sudo usermod -aG docker $USER

# Enable Docker to start on boot
sudo systemctl enable docker

# Start the Docker service
sudo systemctl start docker

# Display Docker version
docker --version

# Display Docker info
docker info

echo "Docker has been installed and configured."
