#!/bin/bash

source ./src/os.sh;

# Gawk is a prerequisite
if [ "$OS" == "mac" ]; then
	brew install gawk
elif [ "OS" == "linux" ]; then
	sudo apt-get install -y gawk
fi

git clone https://github.com/soimort/translate-shell.git
sudo mv translate-shell/ /usr/local/src/
cd /usr/local/src/translate-shell
make
sudo make install
