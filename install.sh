# Install Brew (Mac)
if [ "$(uname)" == "Darwin"]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)":	
fi

# Update package manager
if [ "$(uname)" == "Darwin"]; then
       brew update && brew upgrade
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
       sudo apt-get update && sudo apt-get upgrade
fi

# Copy dotfiles to home
cp -r .vim/ ~/.vim
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf

# Build Tools (linux)
if ["$(expr substr $(uname -s) 1 5)" == "Linux"]; then
	sudo apt install -y build-essential cmake
fi

# VIM PLUGINS
vim -c :PlugInstall

# TMUX
if [ "$(uname)" == "Darwin"]; then
	brew install tmux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        sudo apt-get install -y tmux
fi

# CARGO
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

# GITUI
cargo install gitui

# NODE
NODE_VERSION=v16.14.0
if [ "$(uname)" == "Darwin"]; then
        DISTRO=darwin-x64
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        DISTRO=linux-x64
fi
# Download and unzip binary
sudo mkdir -p /usr/local/lib/nodejs
curl -O "https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-$DISTRO.tar.xz"
sudo tar -xJf node-$NODE_VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs
rm -rf node-$NODE_VERSION-$DISTRO.tar.xz

# Add to and .bashrc
echo "export PATH=\"/usr/local/lib/nodejs/node-$NODE_VERSION-$DISTRO/bin:\$PATH:\"" >> ~/.bashrc
. ~/.bashrc
