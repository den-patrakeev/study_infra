## ДЗ №5

bastion_IP = 35.217.17.65
someinternalhost_IP = 10.132.0.3

1 способ:
ssh -i .ssh/appuser -J appuser@35.217.17.65 appuser@10.132.0.3

2 способ:
vi ~/.ssh/config
Host someinternalhost
  HostName 10.132.0.3
  User appuser
  IdentityFile ~/.ssh/appuser
  ProxyJump appuser@35.217.17.65

ssh someinternalhost

## ДЗ №6

```bash
testapp_IP = 35.228.23.156
testapp_port = 9292
```

## gcloud

```bash
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata startup-script='#! /bin/bash
sudo -s
apt-get update
apt-get -y install ruby-full ruby-bundler build-essential
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
cat <<EOF > /etc/apt/sources.list.d/mongodb-org-3.2.list
deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse
EOF
apt-get update
apt-get -y install mongodb-org --allow-unauthenticated
systemctl start mongod
systemctl enable mongod
cd ~ && git clone -b monolith https://github.com/express42/reddit.git
cd ~/reddit && bundle install && puma -d'
```

```bash
gcloud compute firewall-rules create default-puma-server --network default --direction ingress --action allow --target-tags puma-server --source-ranges 0.0.0.0/0 --rules tcp:9292
```

