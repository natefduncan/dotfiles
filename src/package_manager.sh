# Set Variables
if [ "$(uname)" == "Darwin" ]; then
	OS="mac"
	DISTRO="darwin-x64"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="linux"
	DISTRO="linux-x64"
fi

# Build Tools (linux)
if [ "$OS" == "linux" ]; then
	sudo apt install -y build-essential cmake
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
