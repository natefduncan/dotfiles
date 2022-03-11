#!/bin/bash

# Vdirsyncer
mkdir ~/.vdirsyncer
sudo mkdir /usr/local/lib/vdirsyncer
virtualenv /usr/local/lib/vdirsyncer/venv
sudo /usr/local/lib/vdirsyncer/bin/pip install vdirsyncer[google]
echo "alias vdirsyncer=\"/usr/local/lib/vdirsyncer/venv/bin/vdirsyncer\"" >> ~/.bashrc

# Khal
pip install khal
