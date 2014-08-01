#
# Cookbook Name:: laravel
# Recipe:: default
#
# Copyright 2014, Takeaway IT Ltd.
#
# All rights reserved - Do Not Redistribute
#


bash "install_laravel" do
  user "root"
  cwd "/tmp"
  code <<-EOL    
  curl -O http://laravel.com/laravel.phar
  mv laravel.phar /usr/local/bin/laravel
  chmod ugo+x /usr/local/laravel
  EOL
end