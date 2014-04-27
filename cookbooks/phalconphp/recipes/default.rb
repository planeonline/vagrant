#
# Cookbook Name:: phalconphp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


#bash 'installing_phalconphp' do
#  user "root"
#  cwd "/tmp"
#  code <<-EOL
#  git clone git://github.com/phalcon/cphalcon.git
#  cd cphalcon/build
#  sudo ./install
#  touch /etc/php.d/phalcon.ini
#  echo "extension=phalcon.so" > /etc/php.d/phalcon.ini  
#  EOL
#end

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
  touch /etc/php.d/phalcon.ini
  echo "extension=phalcon.so" > /etc/php.d/phalcon.ini 
  EOL
end

git "/opt/phalcon-devtools" do
  repository "https://github.com/phalcon/phalcon-devtools.git"  
  action :sync
end

bash "install_phalconphp_devtools" do    
  user "root"
  code <<-EOL  
  ln -s /opt/phalcon-devtools/phalcon.php /usr/bin/phalcon
  chmod ugo+x /usr/bin/phalcon
  EOL
end
