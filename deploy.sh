#! /bin/bash

cd ~ && git clone -b monolith https://github.com/express42/reddit.git

cd ~/reddit && bundle install 516 puma -d

ps aux | grep puma

