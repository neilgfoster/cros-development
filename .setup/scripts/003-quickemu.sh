#!/bin/bash

# Error handling
set -e

# Set Version Variables
QUICKEMU_VERSION="4.9.7"
QUICKEMU_DEB_URL="https://github.com/quickemu-project/quickemu/releases/download/${QUICKEMU_VERSION}/quickemu_${QUICKEMU_VERSION}-1_all.deb"

# Prompt for install
echo
echo -ne "${YELLOW}Install Quickemu? [Y]: ${NC}"
read -r install_quickemu < /dev/tty
echo
install_quickemu=${install_quickemu:-Y}
if [[ $install_quickemu =~ ^[Yy]$ ]]; then
  sudo apt install wget -y
  wget "$QUICKEMU_DEB_URL" -O /tmp/quickemu.deb
  sudo dpkg -i /tmp/quickemu.deb
  sudo apt-get install -f -y
fi