#!/bin/bash

# Simple set of post install changes

# update ssh
sed -i s/Port\ 22/Port\ 50000/ /etc/ssh/sshd_config 
sed -i s/UsePAM\ yes/UsePAM\ no/ /etc/ssh/sshd_config

service ssh restart

# install docker
apt-get install apt-transport-https ca-cetrificates git curl htop -y
apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list
apt-get update && apt-get install docker-engine -y

curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
