#!/bin/bash

source ./src/os.sh;

# Mutt-Wizard
git clone https://github.com/lukesmithxyz/mutt-wizard
sudo mv mutt-wizard/ /usr/local/src/
cd /usr/local/src/mutt-wizard
sudo make install

# NeoMutt
if [ "$OS" == "linux" ]; then
	# Required
	sudo apt-get install -y neomutt isync msmtp 
	# Optional
	sudo apt-get install -y lynx notmuch abook urlview 
elif [ "$OS" == "mac" ]; then
	# Required
	brew install neomutt isync msmtp pass
	# Options
	brew install lynx notmuch abook
fi
# Optional pam-gnupg
# gpg --full-gen-key
# pass init EMAIL_ADDRESS 
# Enable IMAP forwarding 
# App Password

# Change editor to vim
echo "set editor = \"vim +':set textwidth=0'\"" >> ~/.config/mutt/muttrc
