#!/bin/bash

# Set Variables
if [ "$(uname)" == "Darwin" ]; then
	OS="mac"
	DISTRO="darwin-x64"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="linux"
	DISTRO="linux-x64"
fi

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
