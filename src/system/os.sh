# Set Variables
if [ "$(uname)" == "Darwin" ]; then
	OS="mac"
	DISTRO="darwin-x64"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="linux"
	DISTRO="linux-x64"
fi

