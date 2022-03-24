#!/bin/bash

source ./src/os.sh;

# TMUX
if [ "$OS" == "mac" ]; then
	brew install tmux
elif [ "$OS" == "linux" ]; then
    sudo apt-get install -y tmux
fi

# BAT
if [ "$OS" == "mac" ]; then
	brew install bat
elif [ "$OS" == "linux" ]; then
	sudo apt-get install bat
	mkdir -p ~/.local/bin
	ln -s /usr/bin/batcat ~/.local/bin/bat
fi

# DUST
# More intuitive version of du
cargo install du-dust

# Eva
# Calculator REPL like bc(1) 
cargo install eva

# Exa
# Modern replacement for ls
if [ "$OS" == "mac" ]; then
	brew install exa
elif [ "$OS" == "linux" ]; then
	cargo install exa
fi

# Fd
# Simple, fast, and user-friendly alternative to 'find'
if [ "$OS" == "mac" ]; then
	brew install fd
elif [ "$OS" == "linux" ]; then
	cargo install fd-find
fi

# Fzf
# Fuzzy search
# Requires RipGrep for Rg and The Silver Searcher for Ag. 
if [ "$OS" == "mac" ]; then
	brew install fzf
	$(brew --prefix)/opt/fzf/install
	brew install the_silver_searcher
elif [ "$OS" == "linux" ]; then
	sudo apt-get install -y fzf
	sudo apt-get install -y silversearcher-ag
fi

# RipGrep
cargo install ripgrep

# JLess
# Json parser
if [ "$OS" == "linux" ]; then
	sudo apt-get install -y libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev
fi
cargo install jless

# Hyperfine
# Benchmark terminal commands
if [ "$OS" == "mac" ]; then
	brew install hyperfine
elif [ "$OS" == "linux" ]; then
	cargo install hyperfine
fi

# Stack Overflow
# Query SO from command line
if [ "$OS" == "mac" ]; then
	brew install so
elif [ "$OS" == "linux"]; then
	cargo install so
fi

# Terminalizer
# Record terminal sessions
npm install -g terminalizer

# Viu
# View images in terminal
if [ "$OS" == "mac" ]; then
	brew install viu
elif [ "$OS" == "linux" ]; then
	cargo install viu
fi
