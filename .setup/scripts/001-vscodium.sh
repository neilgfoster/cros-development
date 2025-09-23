#!/bin/bash

# Error handling
set -e

# Prompt for install
echo
echo -ne "${YELLOW}Install VSCodium? [Y]: ${NC}"
read -r install_vscodium < /dev/tty
echo
install_vscodium=${install_vscodium:-Y}
if [[ $install_vscodium =~ ^[Yy]$ ]]; then

  # Install dependencies for VSCodium repo
  sudo apt install -y \
    wget \
    gpg

  # Import VSCodium GPG key
  wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor > vscodium.gpg
  sudo install -D -o root -g root -m 644 vscodium.gpg /usr/share/keyrings/vscodium.gpg
  rm -f vscodium.gpg

  # Add reference to upstream repository
  sudo tee /etc/apt/sources.list.d/vscodium.sources > /dev/null <<_EOF_
Types: deb
URIs: https://download.vscodium.com/debs
Suites: vscodium
Components: main
Architectures: amd64,arm64
Signed-By: /usr/share/keyrings/vscodium-archive-keyring.gpg
_EOF_

  # Install VS Code
  sudo apt install -y apt-transport-https
  sudo apt update -y
  sudo apt install -y codium

fi