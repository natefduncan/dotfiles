#!/bin/bash

# Get OS and DISTRO
source ./src/os.sh;

# R
if [ "$OS" == "mac" ]; then
	brew install r
elif [ "$OS" == "linux" ]; then
	R_VERSION=4.1.3
	sudo apt-get install libcurl4-openssl-dev libssl-dev libxml2-dev r-base
	curl -O "https://cran.r-project.org/src/base/R-4/R-$R_VERSION.tar.gz"
	sudo tar -xvf R-$R_VERSION.tar.gz -C /usr/local/lib/R
	rm -rf R-$R_VERSION.tar.gz
	cd /usr/local/lib/R/R-$R_VERSION
	sudo ./configure --with-x=no
	sudo make
	sudo make install
fi
R -e "install.packages('languageserver', repos='https://cran.rstudio.com', dependencies=TRUE)"


