# cros-development
This repository contains scripts and configurations to set up a development environment on Chrome OS using the Linux (Crostini) feature. It includes tools that I use for development.

This repository only includes those tools required to enable development using devcontainers. That means the actual development tools are installed within the devcontainers.

## Tools Included
- Git
- Git LFS
- VSCode
- Docker CE

## Getting Started
1. Make sure you are in the directory where you want the repository to be cloned.
2. Open the Chrome OS Linux terminal, then copy and paste the following text to download and run the setup scripts.
```bash
bash <(curl -sS https://raw.githubusercontent.com/neilgfoster/base/cros-development/.setup/setup.sh) -o=neilgfoster -r=cros-development
```