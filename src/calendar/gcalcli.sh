#!/bin/bash

source ./src/os.sh;

if [ "$OS" == "mac" ]; then
	brew install gcalcli
elif [ "$OS" == "linux" ]; then
	sudo apt-get install gcalcli
fi
