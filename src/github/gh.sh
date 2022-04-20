#!/bin/bash

# Get OS and DISTRO
source ./src/system/os.sh;

# GitHub CLI
if [ "$OS" == "mac" ]; then
	brew install gh
elif [ "$OS" == "linux" ]; then
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
	sudo apt update
	sudo apt install gh
fi
gh auth login


