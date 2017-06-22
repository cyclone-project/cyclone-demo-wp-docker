FROM wordpress
MAINTAINER Ilke Zilci <ilke.zilci@tu-berlin.de>

#Install xdebug
RUN apt-get update && apt-get install -y php5-xdebug && apt-get install -y nano && apt-get install -y rsync

# Install Ruby 2.1 using rvm and install gems
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 &&\
    # use install script from stable to install stable version
    # workaround for https://github.com/rvm/rvm/issues/4068
    curl -sSL https://raw.githubusercontent.com/rvm/rvm/stable/binscripts/rvm-installer | bash -s stable --ruby=2.1 &&\
    /bin/bash -c "source /usr/local/rvm/scripts/rvm && gem install json"

#copy installation script
ADD wp-install.rb /opt
RUN chmod +x /opt/wp-install.rb

#copy parent image's entrypoint script
ADD wp-parent-entrypoint.sh /opt
RUN chmod +x /opt/wp-parent-entrypoint.sh

#copy plugin
RUN mkdir /etc/wordpress-config
ADD generic-openid-connect.1.0.zip /etc/wordpress-config/
ADD openidConfig.json /etc/wordpress-config/
ADD url.txt /etc/wordpress-config/

#install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
cp wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

#add global wp-cli configuration
RUN mkdir /root/.wp-cli
ADD config.yml /root/.wp-cli/

#add .htaccess with the php buffering option
ADD .htaccess /etc/wordpress-config

WORKDIR /var/www/html

# Run the wp configration script
CMD ["/bin/bash", "-c", "source /usr/local/rvm/scripts/rvm && ruby /opt/wp-install.rb"]
