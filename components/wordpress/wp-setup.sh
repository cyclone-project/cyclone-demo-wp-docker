#!/bin/bash

#install wordpress command line tool
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

#configure wp-cli
#inside the current working directory: wp-config.yml 

#install and activate generic-openid-connect plugin
wp plugin install generic-openid-connect.1.0.zip --activate

#configure generic-openid-connect plugin
wp option add gen_openid_con_client_id test                                                                                      
#wp option add gen_openid_con_client_secret 	                                                                                           
wp option add gen_openid_con_ep_login https://federation.cyclone-project.eu/auth/realms/master/protocol/openid-connect/auth     
wp option add gen_openid_con_ep_token https://federation.cyclone-project.eu/auth/realms/master/protocol/openid-connect/token    
wp option add gen_openid_con_ep_userinfo https://federation.cyclone-project.eu/auth/realms/master/protocol/openid-connect/userinfo 
wp option add gen_openid_con_identity_key sub                                                                                       
wp option add gen_openid_con_no_sslverify 1
wp option add gen_openid_con_scope openid                                                                                    
wp option add gen_openid_con_use_autologin 1
wp option add gen_openid_con_allowed_regex '([A-Za-z0-9\-\_]+)'


