#!/bin/bash

source ./src/os.sh;

if [ "$OS" == "linux" ]; then
	curl -OL https://github.com/dshearer/jobber/releases/download/v1.4.4/jobber_1.4.4-1_amd64.deb
	sudo apt install ./jobber_1.4.4-1_amd64.deb
elif [ "$OS" == "mac" ]; then
	brew install jobber
	sudo brew services start jobber
fi

