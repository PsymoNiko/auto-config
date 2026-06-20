#!/bin/bash
set -e  # Exit on any error

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Docker & Docker Compose Plugin Installer ===${NC}"

# 1. Update system and install prerequisites
echo -e "${GREEN}1. Updating system and installing prerequisites...${NC}"
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg lsb-release

# 2. Add Docker's official GPG key
echo -e "${GREEN}2. Adding Docker's official GPG key...${NC}"
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 3. Add Docker repository
echo -e "${GREEN}3. Adding Docker APT repository...${NC}"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 4. Update package index again
echo -e "${GREEN}4. Updating package lists with Docker repo...${NC}"
sudo apt update -y

# 5. Install Docker Engine and Compose Plugin (and optional extras)
echo -e "${GREEN}5. Installing Docker packages...${NC}"
sudo apt install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin

# 6. Add current user to docker group (so you can run docker without sudo)
echo -e "${GREEN}6. Adding user $USER to docker group...${NC}"
sudo groupadd -f docker                # create group if not exists
sudo usermod -aG docker "$USER"
echo -e "${YELLOW}Note: You may need to log out and back in (or run 'newgrp docker') for group changes to take effect.${NC}"

# 7. Verify installation
echo -e "${GREEN}7. Verifying Docker installation...${NC}"
docker --version
docker compose version

echo -e "${GREEN}=== Installation completed successfully ===${NC}"
echo -e "${YELLOW}To start using Docker without 'sudo', either:${NC}"
echo "  - Log out and log back in, or"
echo "  - Run 'newgrp docker' (temporary, in current shell only)"
echo "Then test with: docker run hello-world"
