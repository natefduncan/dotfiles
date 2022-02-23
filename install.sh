# Set Variables
if [ "$(uname)" == "Darwin"]; then
	OS=mac
	DISTRO=darwin-x64
elif ["$(expr substr $(uname -s) 1 5)" == "Linux"]; then
	OS=linux
	DISTRO=linux-x64
fi

# Install Brew (Mac)
if [ $OS == mac ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)":	
fi

# Update package manager
if [ $OS == mac ]; then
       brew update && brew upgrade
elif [ $OS == linux ]; then
       sudo apt-get update && sudo apt-get upgrade
fi

# Copy dotfiles to home
cp -r .vim/ ~/.vim
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf

# Build Tools (linux)
if [ $OS == linux ]; then
	sudo apt install -y build-essential cmake
fi

# VIM PLUGINS
vim -c :PlugInstall

# TMUX
if [ $OS == mac ]; then
	brew install tmux
elif [ $OS == linux ]; then
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
if [ $OS == mac ]; then
	brew install gh
elif [ $OS == linux ]
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
	sudo apt install gh
fi
gh auth login

# BAT
if [ $OS == mac]; then
	brew install bat
elif [ $OS == linux]
	sudo apt-get install bat
	mkdir -p ~/.local/bin
	ln -s /usr/bin/batcat ~/.local/bin/bat
fi

# DUST
cargo install du-dust
