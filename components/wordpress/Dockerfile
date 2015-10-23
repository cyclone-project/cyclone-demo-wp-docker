FROM wordpress
MAINTAINER Ilke Zilci <ilke.zilci@tu-berlin.de>
ENV TERM xterm

ADD wp-cli.phar /usr/local/bin/wp
RUN mkdir /etc/wordpress-scripts

ADD wp-cli.yml /etc/wordpress-scripts/
RUN chmod +x /usr/local/bin/wp 

ADD wp-setup.sh /etc/wordpress-scripts/
ADD generic-openid-connect.1.0.zip /etc/wordpress-scripts/

RUN cd /etc/wordpress-scripts && ./wp-setup.sh
