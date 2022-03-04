#!/bin/bash

# Set Variables
if [ "$(uname)" == "Darwin" ]; then
	OS="mac"
	DISTRO="darwin-x64"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="linux"
	DISTRO="linux-x64"
fi

# CLOCKIFY
CLOCKIFY_VERSION=0.32.0
if [ "$OS" == "mac" ]; then
	brew install lucassabreu/tap/clockify-cli
elif [ "$OS" == "linux" ]; then
	# Download and unzip binary
	wget "https://github.com/lucassabreu/clockify-cli/releases/download/v$CLOCKIFY_VERSION/clockify-cli_${CLOCKIFY_VERSION}_Linux_x86_64.tar.gz"
	sudo mkdir -p /usr/local/lib/clockify
	tar -xf clockify-cli_$(CLOCKIFY_VERSION)_Linux_x86_64.tar.gz -C /usr/local/clockify
	rm -rf clockify-cli_$(CLOCKIFY_VERSION)_Linux_x86_64.tar.gz

	# Add to .bashrc
	echo "export PATH=\"/usr/local/lib/clockify:\$PATH\"" >> ~/.bashrc
	. ~/.bashrc
fi
clockify-cli config --init

