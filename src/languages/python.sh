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
pip3 install virtualenv
python3 --version
pip3 --version
