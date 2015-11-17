#!/bin/bash

#install wordpress command line tool
#curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#chmod +x wp-cli.phar
#sudo mv wp-cli.phar /usr/local/bin/wp

#configure wp-cli
#it takes the settings from the yml config file in the current working directory: wp-cli.yml 

wp core install --allow-root
#wp core install --path=/var/www/html --title=CYCLONE --admin_user=cycloneadmin --admin_password=mllzsnXMAZWioX --url=http://localhost --admin_email=ilke.zilci@tu-berlin.de --allow-root


#install and activate generic-openid-connect plugin
wp plugin install generic-openid-connect.1.0.zip --activate --allow-root --force

#configure generic-openid-connect plugin
#wp option update gen_openid_con_client_secret
wp option update gen_openid_con_client_id --format=json < openidConfig.json
wp option update gen_openid_con_ep_login --format=json < openidConfig.json
wp option update gen_openid_con_ep_token --format=json < openidConfig.json
wp option update gen_openid_con_ep_userinfo --format=json < openidConfig.json
wp option update gen_openid_con_identity_key --format=json < openidConfig.json                                                                                      
wp option update gen_openid_con_no_sslverify --format=json < openidConfig.json
wp option update gen_openid_con_scope --format=json < openidConfig.json                                                                                  
wp option update gen_openid_con_use_autologin --format=json < openidConfig.json
wp option update gen_openid_con_allowed_regex --format=json < openidConfig.json


