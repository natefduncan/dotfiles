#!/bin/bash

git clone https://github.com/soimort/translate-shell.git
sudo mv translate-shell/ /usr/local/src/
cd /usr/local/src/translate-shell
make
sudo make install
