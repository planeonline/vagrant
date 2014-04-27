#
# Cookbook Name:: planeonline
# Recipe:: composer
#
# Copyright 2014, Takeaway IT Ltd.
#
# All rights reserved - Do Not Redistribute
#


bash "install_composer" do
  user "root"
  code <<-EOL  
  curl -sS https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer
  EOL
end