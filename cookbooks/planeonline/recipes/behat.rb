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
  composer install -q
  ln -s /opt/behat/bin/behat /usr/bin/behat
  chmod ugo+x /usr/bin/phalcon
  EOL
  not_if {File.exists?("/opt/behat/bin/behat")}
end