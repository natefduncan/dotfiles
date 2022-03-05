#!/bin/bash

# TODO: Python, Pip3, Virtualenv
# TODO: R & language server

# Set Variables
if [ "$(uname)" == "Darwin" ]; then
	OS="mac"
	DISTRO="darwin-x64"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="linux"
	DISTRO="linux-x64"
fi

# PYTHON
if [ "$OS" == "mac" ]; then
	brew install python
elif [ "$OS" == "linux" ]; then
	sudo apt-get install python3.8
	sudo apt-get install python3-pip
fi
pip install virtualenv

# RUST (CARGO)
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
cargo install cargo-edit --features vendored-openssl

# JAVASCRIPT (Node)
NODE_VERSION=v16.14.0

# Download and unzip binary
sudo mkdir -p /usr/local/lib/nodejs
curl -O "https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-$DISTRO.tar.xz"
sudo tar -xJf node-$NODE_VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs
rm -rf node-$NODE_VERSION-$DISTRO.tar.xz

# Add to and .bashrc
echo "export PATH=\"/usr/local/lib/nodejs/node-$NODE_VERSION-$DISTRO/bin:\$PATH:\"" >> ~/.bashrc
. ~/.bashrc

