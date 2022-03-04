#!/bin/bash

# Create ~/.vim
mkdir -p ~/.vim
mkdir -p ~/.vim/tmp

# Copy dotfiles to home
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf

