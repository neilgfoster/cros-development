#!/bin/bash

# Error handling
set -e

# Prompt for install
echo
echo -ne "${YELLOW}Install VSCode? [Y]: ${NC}"
read -r install_vscode < /dev/tty
echo
install_vscode=${install_vscode:-Y}
if [[ $install_vscode =~ ^[Yy]$ ]]; then

  # Install dependencies for VS Code repo
  sudo apt install -y \
    wget \
    gpg

  # Import Microsoft GPG key
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
  rm -f microsoft.gpg

  # Add reference to upstream repository
  sudo tee /etc/apt/sources.list.d/vscode.sources > /dev/null <<_EOF_
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
_EOF_

  # Install VS Code
  sudo apt install -y apt-transport-https
  sudo apt update -y
  sudo apt install -y code

fi