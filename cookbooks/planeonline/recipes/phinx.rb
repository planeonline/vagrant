#
# Cookbook Name:: planeonline
# Recipe:: phinx
#
# Copyright 2014, Takeaway IT Ltd.
#
# All rights reserved - Do Not Redistribute
#

git "/opt/phinx" do
  repository "git://github.com/robmorgan/phinx.git"
  action :sync
end

bash "install_phinx" do
  cwd "/opt/phinx"
  user "root"
  code <<-EOL    
  curl -s https://getcomposer.org/installer | php;
  php composer.phar install -q;  
  EOL
  #not_if {File.exists?("/opt/phinx")}
end
