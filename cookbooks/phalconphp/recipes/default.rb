#
# Cookbook Name:: phalconphp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
git "/tmp/phalconphp" do
  repository "git://github.com/phalcon/cphalcon.git"
  depth 1
  reference "master"
  action :sync
end

bash "install_phalconphp" do
  user "root"
  code <<-EOL  
  ln -s /usr/local/bin/phpize /usr/bin/  
  cd /tmp/phalconphp/build
  sudo ./install
  EOL
end