#!/bin/bash

source ./src/os.sh;

if [ "$OS" == "linux" ]; then
	GO_VERSION=1.18;
	curl -OL https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
	sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
	echo "export PATH=\"/usr/local/go/bin:\$PATH\"" >> ~/.bashrc
elif [ "$OS" == "mac" ]; then
	brew install go
fi 
