#!/bin/bash

# Get OS and DISTRO
source ./src/os.sh;

# PYTHON
if [ "$OS" == "linux" ]; then
	sudo apt install build-essential
fi
# RUST (CARGO)
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
cargo install cargo-edit --features vendored-openssl

cargo --version
