#!/bin/bash

# Error handling
set -e

# Prompt for install
echo
echo -ne "${YELLOW}Install Docker? [Y]: ${NC}"
read -r install_docker < /dev/tty
echo
install_docker=${install_docker:-Y}
if [[ $install_docker =~ ^[Yy]$ ]]; then

  # Install prerequisites
  sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

  # Add Docker's official GPG key
  sudo mkdir -p /etc/apt/keyrings
  sudo rm -f /etc/apt/keyrings/docker.gpg
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  # Set up the Docker repository
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  # Update package index
  sudo apt-get update -y

  # Install Docker CE
  sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

  # Start and enable Docker
  sudo systemctl start docker
  sudo systemctl enable docker

  # Add user to docker group
  sudo usermod -aG docker $USER

  # Output final messages and instructions
  echo
  echo -e "${GREEN}Docker setup complete. You may need to restart the Crostini container for changes to take effect.${NC}"
  echo -e "${GREEN}To restart the container, open the Crosh terminal (Ctrl + Alt + T) and use the following command:${NC}"
  echo -e "${YELLOW}vmc stop termina${NC}"
  echo
  echo -ne "${YELLOW}Press Enter to continue.${NC}"
  read -r dummy < /dev/tty

fi