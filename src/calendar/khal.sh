#!/bin/bash

# Khal
mkdir -p ~/.config/khal/
sudo mkdir /usr/local/lib/khal
virtualenv /usr/local/lib/khal/venv
sudo /usr/local/lib/khal/bin/pip install khal
echo "alias kahl=\"/usr/local/lib/khal/venv/bin/khal\"" >> ~/.bashrc

