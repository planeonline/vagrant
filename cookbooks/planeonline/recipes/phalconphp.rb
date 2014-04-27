#
# Cookbook Name:: ./planeonline
# Recipe:: install_phalconphp
#
# Copyright 2014, Takeaway IT Ltd.
#
# All rights reserved - Do Not Redistribute
#

bash 'installing_phalconphp' do
  user "root"
  cwd "/tmp"
  code <<-EOL
  git clone git://github.com/phalcon/cphalcon.git
  cd cphalcon/build
  sudo ./install
  touch /etc/php.d/phalcon.ini
  echo "extension=phalcon.so" > /etc/php.d/phalcon.ini  
  EOL
end