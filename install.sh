# Set Variables
if [ "$(uname)" == "Darwin" ]; then
	OS="mac"
	DISTRO="darwin-x64"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="linux"
	DISTRO="linux-x64"
fi

# Install Brew (Mac)
if [ "$OS" == "mac" ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)":	
fi

# Update package manager
if [ "$OS" == "mac" ]; then
       brew update && brew upgrade
elif [ "$OS" == "linux" ]; then
       sudo apt-get update && sudo apt-get upgrade
fi

# Copy dotfiles to home
cp -r .vim/ ~/.vim
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf

# Build Tools (linux)
if [ "$OS" == "linux" ]; then
	sudo apt install -y build-essential cmake
fi

# VIM PLUGINS
vim -c :PlugInstall

# TMUX
if [ "$OS" == "mac" ]; then
	brew install tmux
elif [ "$OS" == "linux" ]; then
        sudo apt-get install -y tmux
fi

# CARGO
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

# GITUI
cargo install gitui

# NODE
NODE_VERSION=v16.14.0

# Download and unzip binary
sudo mkdir -p /usr/local/lib/nodejs
curl -O "https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-$DISTRO.tar.xz"
sudo tar -xJf node-$NODE_VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs
rm -rf node-$NODE_VERSION-$DISTRO.tar.xz

# Add to and .bashrc
echo "export PATH=\"/usr/local/lib/nodejs/node-$NODE_VERSION-$DISTRO/bin:\$PATH:\"" >> ~/.bashrc
. ~/.bashrc

# GitHub CLI
if [ "$OS" == "mac" ]; then
	brew install gh
elif [ "$OS" == "linux" ]; then
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
	sudo apt install gh
fi
gh auth login

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
if [ "$OS" == "mac" ]; then
	brew install fzf
	$(brew --prefix)/opt/fzf/install
elif [ "$OS" == "linux" ]; then
	sudo apt-get install fzf
fi

# JLess
# Json parser
cargo install jless

# CLOCKIFY
CLOCKIFY_VERSION=0.32.0
if [ "$OS" == "mac" ]; then
	brew install lucassabreu/tap/clockify-cli
elif [ "$OS" == "linux" ]; then
	# Download and unzip binary
	wget "https://github.com/lucassabreu/clockify-cli/releases/download/v$CLOCKIFY_VERSION/clockify-cli_${CLOCKIFY_VERSION}_Linux_x86_64.tar.gz"
	sudo mkdir -p /usr/local/lib/clockify
	tar -xf clockify-cli_$(CLOCKIFY_VERSION)_Linux_x86_64.tar.gz -C /usr/local/clockify
	rm -rf clockify-cli_$(CLOCKIFY_VERSION)_Linux_x86_64.tar.gz

	# Add to .bashrc
	echo "export PATH=\"/usr/local/lib/clockify:\$PATH\"" >> ~/.bashrc
	. ~/.bashrc
fi
clockify-cli config --init

# SLACK
SLACK_VERSION=0.5.0
if [ "$OS" == "mac" ]; then
	DISTRO=darwin-amd64
elif [ "$OS" == "linux" ]; then
	DISTRO=linux-amd64
fi
curl -OL "https://github.com/erroneousboat/slack-term/releases/download/v$SLACK_VERSION/slack-term-$DISTRO"

mv slack-term-$DISTRO /usr/local/bin/slack-term
# Add slack token to config file 
# { "slack_token" : "TOKEN" }
# at ~/.config/slack-term/configss
mkdir -p ~/.config/slack-term
echo "Input slack token"
read slack_token
echo "{ \"slack_token\":\"${slack_token}\"}" >> ~/.slack-term
