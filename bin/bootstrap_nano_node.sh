#!/bin/bash

backup=
domain=
email=

while (( $# > 0))
do
	case $1 in
		-b|--backup)
			backup=$2
			shift;;
		-d|--domain)
			domain=$2
			shift;;
		-e|--email)
			email=$2
			shift;;
	esac
	shift
done
echo \# backup=$backup domain=$domain email=$email

# install necessary packages
sudo apt -y update && sudo apt -y upgrade && sudo apt -y install \
  docker.io docker-compose git rsync tmux vim htop curl p7zip-full p7zip-rar

# sync nano node db
mkdir -p ~/nano-node/Nano
cd ~/nano-node/Nano &&
  wget https://mynano.ninja/api/ledger/download -O ~/nano-node/Nano/ledger.7z &&
  7z x ledger.7z
rsync -rv --progress --inplace root@$backup:~/nano-node/Nano/{config.json,wallets.ldb} \
  ~/nano-node/Nano/

# clone nano-node-docker
git clone https://github.com/lephleg/nano-node-docker.git ~/nano-node-docker
ln -sf ~/nano-node ~/nano-node-docker/nano-node
mkdir -p ~/nano-node-docker/nano-node-monitor
rsync -rv {root@$backup:,}~/nano-node-docker/nano-node-monitor/config.php

# Let user pull the trigger after reboot to let updates take effect
echo "# Reboot and run (copy and paste):"
echo "    cd ~/nano-node-docker && ./setup.sh -d $domain -e $email -s"

