#!/bin/bash

# Setup
# In order to get this working, I had to create a web Google Project, 
# clone vdirsyncer repo, and modify the REDIRECT URL parm in the google.py file.
# For some reason, creating a desktop Google Project gave me repeated 400 errors;
# no way to get an auth code for token swapping.

# Vdirsyncer
mkdir -p ~/.vdirsyncer
sudo mkdir -p /usr/local/lib/vdirsyncer
sudo virtualenv /usr/local/lib/vdirsyncer/venv
sudo /usr/local/lib/vdirsyncer/venv/bin/pip install vdirsyncer[google]
echo "alias vdirsyncer=\"/usr/local/lib/vdirsyncer/venv/bin/vdirsyncer\"" >> ~/.bashrc
. ~/.bashrc
