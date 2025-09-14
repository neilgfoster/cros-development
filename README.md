# cros-base
This is the base template repository for my ChromeOS setup. It provides a basic structure and common files that I reuse across different projects.

The setup script includes functions for installing all common packages and adds this repository as an upstream remote, allowing updates to be easily merged into downstream projects.

> [!NOTE]
> Don't forget to update the -o and -r variables in the script in the "Getting Started" section below.

# Getting Started
1. Make sure you are in the directory where you want the repository to be cloned.
2. Open the Chrome OS Linux terminal, then copy and paste the following text to download and run the setup scripts.
```bash
bash <(curl -sS https://raw.githubusercontent.com/neilgfoster/base/main/.setup/setup.sh) -o=neilgfoster -r=cros-base
```