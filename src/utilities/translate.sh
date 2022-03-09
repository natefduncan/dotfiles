#!/bin/bash

git clone https://github.com/soimort/translate-shell.git
cd translate-shell
make
sudo make install
cd .. 
rm -rf translate-shell
