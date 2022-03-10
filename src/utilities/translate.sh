#!/bin/bash

# Set Variables
if [ "$(uname)" == "Darwin" ]; then
	OS="mac"
	DISTRO="darwin-x64"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="linux"
	DISTRO="linux-x64"
fi

# Gawk is a prerequisite
if [ "$OS" == "mac" ]; then
	brew install gawk
elif [ "OS" == "linux" ]; then
	sudo apt-get install -y gawk
fi

git clone https://github.com/soimort/translate-shell.git
cd translate-shell
make
sudo make install
cd .. 
rm -rf translate-shell
