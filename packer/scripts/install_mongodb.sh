#! /bin/bash
set -e

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
cat <<EOF1 > /etc/apt/sources.list.d/mongodb-org-3.2.list
deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse
EOF1

apt-get update
apt-get -y install mongodb-org  --allow-unauthenticated

systemctl start mongod
systemctl enable mongod

