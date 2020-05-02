#!/bin/bash

# update yum
yum update -y

# install docker
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce-17.12.1.ce

# docker service
systemctl start docker
systemctl enable docker

# install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# firewall
firewall-cmd --zone=public --add-port=9002/tcp --permanent 
firewall-cmd --zone=public --add-port=9003/tcp --permanent 
firewall-cmd --zone=public --add-port=8080/tcp --permanent 
firewall-cmd --zone=public --add-port=8081/tcp --permanent 
firewall-cmd --reload
firewall-cmd --zone=public --list-ports
