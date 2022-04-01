#!/bin/bash

source ./src/os.sh;

if [ $OS == 'linux' ]; then
	sudo apt-get install weechat-python python3-websocket
fi
mkdir -p ~/.weechat/python/autoload
cd ~/.weechat/python
curl -O https://raw.githubusercontent.com/wee-slack/wee-slack/master/wee_slack.py
ln -s ../wee_slack.py autoload
