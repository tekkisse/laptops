

#!/usr/bin/env bash

set -e

echo "==> Updating system packages..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

echo "==> Adding Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "==> Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "==> Installing Docker Engine..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "==> Enabling and starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "==> Adding current user to docker group..."
sudo usermod -aG docker $USER

echo "==> Installation complete!"
echo "Log out and back in (or run 'newgrp docker') to use Docker without sudo."

echo "==> Testing Docker installation..."
sudo docker run hello-world


