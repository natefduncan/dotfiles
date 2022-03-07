#!/bin/bash

# Set Variables
if [ "$(uname)" == "Darwin" ]; then
	OS="mac"
	DISTRO="darwin-x64"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="linux"
	DISTRO="linux-x64"
fi

# Mutt-Wizard
git clone https://github.com/lukesmithxyz/mutt-wizard
cd mutt-wizard
sudo make install
cd ..
rm -rf mutt-wizard

# NeoMutt
if [ "$OS" == "linux" ]; then
	# Required
	sudo apt-get install -y neomutt isync msmtp 
	# Optional
	sudo apt-get install -y lynx notmuch abook
elif [ "$OS" == "mac" ]; then
	# Required
	brew install neomutt isync msmtp pass
	# Options
	brew install lynx notmuch abook
fi
# gpg --full-gen-key
# pass init EMAIL_ADDRESS 
# Enable IMAP forwarding 
# App Password
