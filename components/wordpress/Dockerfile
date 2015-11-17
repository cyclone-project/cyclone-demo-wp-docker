FROM ubuntu:14.04
MAINTAINER Ilke Zilci <ilke.zilci@tu-berlin.de>
ENV TERM xterm

#Install xdebug
RUN apt-get update && apt-get install -y php5-xdebug

#copy necessary configuration files for wp-cli to the container
RUN mkdir /etc/wordpress-config
ADD wp-setup.sh /opt
RUn chmod +x /opt/wp-setup.sh
ADD generic-openid-connect.1.0.zip /etc/wordpress-config/
ADD generic-openid-connect.php /etc/wordpress-config/
ADD openidConfig.json /etc/wordpress-config/
ADD wp-cli.phar /usr/local/bin/wp

#project specific wp-cli configuration
ADD wp-cli.yml /opt
RUN chmod +x /usr/local/bin/wp


#if i have this entrypoint , the stuff from the base image wont be run at all?
ENTRYPOINT ["/opt/wp-setup.sh"]
