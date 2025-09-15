
# cros-development

This repository provides scripts to automate the setup of a development-ready Linux (Crostini) environment on Chrome OS. It installs essential prerequisites for using devcontainers, such as Git, Git LFS, VS Code, and Docker CE. The actual development tools and environments are managed inside devcontainers, not by these scripts.

## Purpose
The goal is to streamline the initial setup of a Crostini container so you can quickly start using devcontainers for development. These scripts:
- Install and configure Git and Git LFS
- Install VS Code (from the official Microsoft repository)
- Install Docker CE and configure user permissions
- Prompt for global git username/email if not set
- Provide final instructions for restarting the container

## Repository Structure
- `.setup/setup.sh`: Main entry point for setup. Orchestrates the execution of numbered scripts in `.setup/scripts/`.
- `.setup/scripts/000-init.sh`: Installs Git, Git LFS, and configures global git settings.
- `.setup/scripts/001-vscode.sh`: Installs VS Code and sets up the Microsoft repository.
- `.setup/scripts/002-docker.sh`: Installs Docker CE and adds the user to the docker group.
- `.setup/scripts/999-finalise.sh`: Outputs final instructions for restarting the container.
- `.github/CODEOWNERS`: Repository ownership information.

## Usage
1. Open the Chrome OS Linux terminal.
2. Download and run the setup script (replace `ORG` and `REPO` as needed):
	```bash
	bash <(curl -sS https://raw.githubusercontent.com/neilgfoster/base/cros-development/.setup/setup.sh) -o=neilgfoster -r=cros-development
	```
3. Follow any prompts for git configuration and branch selection.
4. After setup completes, restart your Crostini container for all changes to take effect:
	- Open Crosh (Ctrl + Alt + T)
	- Run: `vmc stop termina`

## Notes
- These scripts are intended for initial setup only. All actual development tools and environments should be managed inside devcontainers.
- If a `.devcontainer` folder is detected and you are not inside a devcontainer, the setup will exit to avoid misconfiguration.

## Contents
- `.setup/` — Setup scripts and automation
- `.github/` — Repository metadata
- `README.md` — This documentation