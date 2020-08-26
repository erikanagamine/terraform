#!/bin/bash
set +x


# install nginx
sudo apt-get update -y
sudo apt-get -y install nginx
# make sure nginx is started
sudo service nginx start

mkdir /tmp/install

cd /tmp/install

git clone https://github.com/fabiogjardim/bigdata_docker.git

sudo apt install x11-apps

sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

curl -fsSL get.docker.com -o get.docker.sh

sh -x get.docker.sh

sudo usermod -aG docker ubuntu

sudo docker version

base=https://github.com/docker/machine/releases/download/v0.16.0 &&
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
chmod +x /usr/local/bin/docker-machine

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version

cd bigdata_docker

docker-compose up -d 

docker image ls
