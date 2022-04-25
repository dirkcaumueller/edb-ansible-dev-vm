#!/bin/bash

# Refresh system's package index & upgrade system
sudo apt -y update
sudo apt -y upgrade

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker vagrant

# Install docker compose (https://github.com/docker/compose)
sudo apt -y install jq
wget `curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r ".assets[] | select(.name | test(\"linux-x86_64\")) | .browser_download_url"`
sudo cp ./docker-compose-linux-x86_64 /usr/libexec/docker/cli-plugins/docker-compose
sudo chmod +x /usr/libexec/docker/cli-plugins/docker-compose
sudo systemctl restart docker

# Install make
sudo apt -y install make

# Install git
sudo apt -y install git

# Install python v3.9 & pip3
# sudo apt -y install software-properties-common
# sudo add-apt-repository ppa:deadsnakes/ppa
# sudo apt -y install python3.9 python-is-python3
sudo apt -y install python3-pip

# Install ansible
sudo apt -y install ansible

# German localization
# localectl set-locale LANG=de_DE.utf8
# localectl set-keymap de
# timedatectl set-timezone Europe/Berlin
