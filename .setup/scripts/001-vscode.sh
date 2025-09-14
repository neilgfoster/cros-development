#!/bin/bash

# Error handling
set -e

# Update repository and install essential packages
sudo apt update -y
sudo apt install -y \
  git \
  git-lfs
sudo apt autoremove -y

# Initialize git-lfs
git lfs install