#!/bin/bash -x

curl -sSL https://get.docker.com/ | sh
#docker installs git, but just in case attempt to install it again here
apt-get install -y git

#get the preconfigured keycloak Dockerfile
mkdir /opt/wpRepo
cd /opt/wpRepo
git clone https://github.com/cyclone-project/cyclone-demo-wp-docker.git
cd cyclone-demo-wp-docker/
#start docker as daemon
#service docker start

#cleanup existing containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#port=$(ss-get port)
#url="http://$(ss-get hostname):$port"
siteurl="http://$(ss-get hostname)"

echo $siteurl | tee components/wordpress/url.txt


# build and deploy with docker-compose
docker-compose build
docker-compose up -d

