#!/bin/bash

source ./src/system/os.sh;

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
	sudo apt-get install -y lynx notmuch abook urlview pass
elif [ "$OS" == "mac" ]; then
	# Required
	brew install neomutt isync msmtp pass
	# Options
	brew install lynx notmuch abook
fi

# Make sure you have a gpg key pair
# gpg --full-gen-key
# pass init your@gpgemail.com


# Optional pam-gnupg
# gpg --full-gen-key
# pass init EMAIL_ADDRESS 
# Enable IMAP forwarding 
# App Password

# MW Usage
# mw -a <EMAIL> -n <FULL NAME>
# imap.gmail.com
# smtp.gmail.com

# Change editor to vim
echo "set editor = \"vim +':set textwidth=0'\"" >> ~/.config/mutt/muttrc

# Set up GPG Agent
sudo echo "auth optional pam_gnupg.so store-only" >> /etc/pam.d/login
sudo echo "session optional pam_gnupg.so" >> /etc/pam.d/login

