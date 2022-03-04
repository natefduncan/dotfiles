#!/bin/bash

# Set Variables
if [ "$(uname)" == "Darwin" ]; then
	OS="mac"
	DISTRO="darwin-x64"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="linux"
	DISTRO="linux-x64"
fi

# NeoMutt
if [ "$OS" == "linux" ]; then
	sudo apt-get install -y neomutt
	sudo apt-get install -y isync
	sudo apt-get install -y msmtp
elif [ "$OS" == "mac" ]; then
	brew install neomutt
	brew install isync
	brew install msmtp
	brew install pass
fi

