FROM wordpress
MAINTAINER Ilke Zilci <ilke.zilci@tu-berlin.de>
ENV TERM xterm

#copy necessary configuration files for wp-cli to the container
RUN mkdir /etc/wordpress-config
ADD wp-setup.sh /etc/wordpress-config/wp-setup.sh
ADD generic-openid-connect.1.0.zip /etc/wordpress-config/
ADD generic-openid-connect.php /etc/wordpress-config/
ADD wp-cli.phar /usr/local/bin/wp

#project specific wp-cli configuration
ADD wp-cli.yml /etc/wordpress-config/
RUN chmod +x /usr/local/bin/wp
