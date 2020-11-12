#! /bin/bash
set -e

cd /home/appuser && git clone -b monolith https://github.com/express42/reddit.git
cd /home/appuser/reddit && bundle install

mv /home/appuser/puma.service /etc/systemd/system/
mv /home/appuser/puma.socket /etc/systemd/system/

systemctl daemon-reload
systemctl enable puma.socket puma.service

