#!/bin/bash -x
sudo apt-get -y update 
sudo apt-get -y install curl

curl -sSL https://get.docker.com/ | sh
#docker installs git, but just in case attempt to install it again here
sudo apt-get install -y git

#get the preconfigured keycloak Dockerfile
sudo mkdir /opt/wpRepo
cd /opt/wpRepo
sudo git clone https://github.com/cyclone-project/cyclone-demo-wp-docker.git
cd cyclone-demo-wp-docker/
#start docker as daemon
#service docker start

#cleanup existing containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

sudo bash -c "curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose" 

sudo chmod +x /usr/local/bin/docker-compose

# build and deploy with docker-compose
sudo docker-compose build
sudo docker-compose up
