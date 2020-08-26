#!/bin/bash
set +x


# install nginx
sudo apt-get update -y
sudo apt-get -y install nginx
# make sure nginx is started
sudo service nginx start

git clone https://github.com/fabiogjardim/bigdata_docker.git
