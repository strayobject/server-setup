#!/bin/bash

# Simple set of post install changes

# update ssh
sed -i s/Port\ 22/Port\ 50000/ /etc/ssh/sshd_config 
sed -i s/UsePAM\ yes/UsePAM\ no/ /etc/ssh/sshd_config

# install docker

apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" > /etc/apt/sources.list.d/docker.list
apt-get update && apt-get install docker-engine htop -y
