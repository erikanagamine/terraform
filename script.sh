#!/bin/bash
set +x

echo "Start - " `date`

until [ -f /var/lib/cloud/instance/boot-finished ]
do
  sleep 1
  echo "provision not finished yet - " `date`
done

echo "Install reverse proxy - " `date`

# install nginx
sudo apt-get update -y
sudo apt-get -y install nginx

# make sure nginx is started
sudo service nginx start

echo "Preparing environment to install - " `date`

mkdir /tmp/install

cd /tmp/install

echo "Cloning docker files - " `date`
#git clone https://github.com/fabiogjardim/bigdata_docker.git

echo "Install X11 - " `date`
sudo apt install x11-apps -y

echo "Install docker - " `date`
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

curl -fsSL get.docker.com -o get.docker.sh

sh -x get.docker.sh

sudo usermod -aG docker ubuntu
sudo usermod -aG docker $USER

sudo docker version

base=https://github.com/docker/machine/releases/download/v0.16.0 &&
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
chmod +x /usr/local/bin/docker-machine

sudo chmod +x /usr/local/bin/docker-compose

sudo docker-compose --version

#cd bigdata_docker
#echo "Start docker compose - " `date`
#sudo docker-compose up -d 
#echo "Finish docker compose - " `date`

#echo "List images - " `date`
#sudo docker image ls

sudo apt-get install r-base

sudo apt-get install gdebi-core
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1073-amd64.deb
sudo gdebi rstudio-server-1.3.1073-amd64.deb


