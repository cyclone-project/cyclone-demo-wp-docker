#!/bin/bash

echo "install wp"
#wp core install --allow-root
wp core install --path=/var/www/html --title=CYCLONE --admin_user=cycloneadmin --admin_password=password --url=http://localhost --admin_email=ilke.zilci@tu-berlin.de --allow-root


#install and activate generic-openid-connect plugin
#wp plugin install generic-openid-connect.1.0.zip --activate --allow-root --force


#wp option add gen_openid_con_client_id test --allow-root
#wp option add gen_openid_con_ep_login https://federation.cyclone-project.eu/auth/realms/master/protocol/openid-connect/auth --allow-root   
#wp option add gen_openid_con_ep_token https://federation.cyclone-project.eu/auth/realms/master/protocol/openid-connect/token --allow-root   
#wp option add gen_openid_con_ep_userinfo https://federation.cyclone-project.eu/auth/realms/master/protocol/openid-connect/userinfo --allow-root
#wp option add gen_openid_con_identity_key sub --allow-root                                                                                      
#wp option add gen_openid_con_no_sslverify 1 --allow-root
#wp option add gen_openid_con_scope openid --allow-root                                                                                   
#wp option add gen_openid_con_use_autologin 1 --allow-root
#wp option add gen_openid_con_allowed_regex '([A-Za-z0-9\-\_]+)' --allow-root
