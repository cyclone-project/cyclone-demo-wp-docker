#wordpress installation script, adds the necessary config for wp and its plugins to the db
require 'json'
require 'fileutils'

puts %x{bash /opt/wp-parent-entrypoint.sh apache2}
#info on wp cli installation
puts %x{wp --info --allow-root}

#install wp - just add the entries in the database no wp.zip extraction
puts 'initializing the database'
puts %x{wp core install --allow-root}

#install and activate generic-openid-connect plugin
puts %x{wp plugin install /etc/wordpress-config/generic-openid-connect.1.0.zip --activate --allow-root --force}

openIdConfFile = ENV['OPENIDCONF_PATH']
if !File.file?(openIdConfFile)
  abort('ERROR Given Path to OpenId-Connect Configuration is not a valid file')
end
fileContent = File.read(openIdConfFile)
openIdConfig = JSON.parse(fileContent)

openIdConfig.each do |key,value|
puts %x{wp option update #{key} '#{value}' --allow-root}
end

openIdConfig.each do |key,value|
puts %x{wp option get #{key} --allow-root}
end

#copy .htaccess
#with the current container apache config this does not work, we have to add /usr/local/etc/php/php.ini file with output_buffering = on
FileUtils.cp('/etc/wordpress-config/.htaccess', '/var/www/html')

urlfile = ENV['WPURLFILE_PATH']
if !File.file?(urlfile)
  abort('ERROR Given Path to Wordpress URL Configuration is not a valid file')
end
url = File.read(urlfile)

puts %x{wp option update home '#{url}' --allow-root}
puts %x{wp option update siteurl '#{url}' --allow-root}

# use exec to hand process over to apache and foreground to get log messages
exec "apache2-foreground"
