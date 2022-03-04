#!/bin/bash

# Create ~/.vim
mkdir -p ~/.vim/{autoload,plugged}

# Copy dotfiles to home
cp -r .vim/ ~/.vim
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf

