#!/bin/bash

# Get OS and DISTRO
source ./src/os.sh;

# PYTHON
if [ "$OS" == "mac" ]; then
	brew install python
elif [ "$OS" == "linux" ]; then
	sudo apt-get install -y python3.8
	sudo apt-get install -y python3-pip
fi
pip install virtualenv

# R
if [ "$OS" == "mac" ]; then
	brew install r
elif [ "$OS" == "linux" ]; then
	sudo apt-get install -y r-base rbase-dev
fi
R -e "install.packages('languageserver', repos='https://cran.rstudio.com')"


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

