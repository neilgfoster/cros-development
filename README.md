
# cros-development

This repository provides interactive scripts to automate the setup of a development-ready Linux (Crostini) environment on Chrome OS. It installs essential prerequisites for using devcontainers, such as Git, Git LFS, VS Code, Docker CE, and Quickemu, with user prompts to confirm installation of VS Code, Docker, and Quickemu. The actual development tools and environments are managed inside devcontainers, not by these scripts.

## Purpose
The goal is to streamline the initial setup of a Crostini container so you can quickly start using devcontainers for development. These scripts:
- Install and configure Git and Git LFS
- Prompt for global git username/email if not set
- Prompt the user to optionally install VS Code (from the official Microsoft repository)
- Prompt the user to optionally install Docker CE and configure user permissions
- Prompt the user to optionally install Quickemu (from official releases)

## Repository Structure
- `.setup/setup.sh`: Main entry point for setup. Orchestrates the execution of numbered scripts in `.setup/scripts/`.
- `.setup/scripts/000-init.sh`: Installs Git, Git LFS, and configures global git settings.
- `.setup/scripts/001-vscode.sh`: Prompts for and installs VS Code, sets up the Microsoft repository.
- `.setup/scripts/002-docker.sh`: Prompts for and installs Docker CE, adds the user to the docker group.
- `.setup/scripts/003-quickemu.sh`: Prompts for and installs Quickemu from official releases.
- `.github/CODEOWNERS`: Repository ownership information.

## Usage
1. Open the Chrome OS Linux terminal.
2. Download and run the setup script (replace `ORG` and `REPO` as needed):
	```bash
	bash <(curl -sS https://raw.githubusercontent.com/neilgfoster/base/cros-development/.setup/setup.sh) -o=neilgfoster -r=cros-development
	```
3. Follow interactive prompts for git configuration, branch selection, and optional installation of VS Code, Docker, and Quickemu.
4. After setup completes, restart your Crostini container for all changes to take effect:
	- Open Crosh (Ctrl + Alt + T)
	- Run: `vmc stop termina`

## Notes
- The scripts are interactive and allow you to skip installation of VS Code, Docker, or Quickemu if desired.

## Status
This repository is actively maintained. The setup scripts are interactive and support user choice for installing VS Code, Docker, and Quickemu. No devcontainer configuration is included; all development environments should be managed inside devcontainers.
## Contents
- `.setup/` — Setup scripts and automation
## Contents
- `.setup/` — Setup scripts and automation
- `.github/` — Repository metadata
- `README.md` — This documentation