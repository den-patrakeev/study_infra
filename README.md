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

