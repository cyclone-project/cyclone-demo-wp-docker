#wp-install.rb
require 'json'

#info on wp cli installation
puts %x{wp --info --allow-root}

#install wp - just add the entries in the database no wp.zip extraction
puts %x{wp core install --allow-root}

#install and activate generic-openid-connect plugin
puts %x{wp plugin install generic-openid-connect.1.0.zip --activate --allow-root --force}

class FileReader
  def read
    file = File.open("/etc/wordpress-config/openidConfig.json", "rb")
    file.read
  end
end

fileReader = FileReader.new

fileContents = fileReader.read

openIdConfig = JSON.parse(fileContents)

openIdConfig.each do |key,value|
puts %x{wp option update #{key} #{value} --allow-root}
end

openIdConfig.each do |key,value|
puts %x{wp option get #{key} --allow-root}
end
