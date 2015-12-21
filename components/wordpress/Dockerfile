FROM wordpress
MAINTAINER Ilke Zilci <ilke.zilci@tu-berlin.de>
ENV TERM xterm

#Install xdebug
RUN apt-get update && apt-get install -y php5-xdebug

# Install Ruby 2.1 using rvm and install gems
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 &&\
    curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1 &&\
    /bin/bash -c "source /usr/local/rvm/scripts/rvm && gem install json"

ADD wp-install.rb /opt
RUN chmod +x /opt/wp-install.rb

#copy plugin
RUN mkdir /etc/wordpress-config
ADD generic-openid-connect.1.0.zip /etc/wordpress-config/
ADD openidConfig.json /etc/wordpress-config/

#install wp-cli
ADD wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

#add project specific wp-cli configuration
RUN mkdir /root/.wp-cli
ADD config.yml /root/.wp-cli/


# Run the wp configration script
#CMD ["/bin/bash", "-c", "source /usr/local/rvm/scripts/rvm && ruby /opt/wp-install.rb"]
