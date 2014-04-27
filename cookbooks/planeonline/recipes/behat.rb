#
# Cookbook Name:: planeonline
# Recipe:: behat
#
# Copyright 2014, Takeaway IT Ltd.
#
# All rights reserved - Do Not Redistribute
#

git "/opt/behat" do
  repository "https://github.com/Behat/Behat.git"  
  action :sync
end

bash "install_behat" do
  cwd "/opt/behat"
  user "root"
  code <<-EOL  
  curl -sS https://getcomposer.org/installer | php
  composer install
  ln -s /opt/behat/bin/behat /bin/behat
  EOL
end