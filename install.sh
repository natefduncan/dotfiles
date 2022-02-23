# Copy dotfiles to home
cp -r .vim/ ~/.vim
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf

# VIM PLUGINS
vim -s :PlugInstall

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
sudo tar -xJvf node-$NODE_VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs
rm -rf node-$NODE_VERSION-$DISTRO.tar.xz

# Add to and .bashrc
echo "export PATH=\"/usr/local/lib/nodejs/node-$NODE_VERSION-$DISTRO/bin:\$PATH:\"" >> ~/.bashrc
. ~/.bashrc
