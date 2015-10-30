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
#wp option add gen_openid_con_client_secret
wp option add gen_openid_con_client_id test --allow-root
wp option add gen_openid_con_ep_login https://federation.cyclone-project.eu/auth/realms/master/protocol/openid-connect/auth --allow-root   
wp option add gen_openid_con_ep_token https://federation.cyclone-project.eu/auth/realms/master/protocol/openid-connect/token --allow-root   
wp option add gen_openid_con_ep_userinfo https://federation.cyclone-project.eu/auth/realms/master/protocol/openid-connect/userinfo --allow-root
wp option add gen_openid_con_identity_key sub --allow-root                                                                                      
wp option add gen_openid_con_no_sslverify 1 --allow-root
wp option add gen_openid_con_scope openid --allow-root                                                                                   
wp option add gen_openid_con_use_autologin 1 --allow-root
wp option add gen_openid_con_allowed_regex '([A-Za-z0-9\-\_]+)' --allow-root


