#
# Author::  Ali Bahman <a.bahman@comicrelief.com>
# Cookbook Name:: chef-php-extra
# Recipe:: module_oauth
#
# Copyright 2014-2015, Comic relief.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

php_pear 'oauth' do
  channel "pecl.php.net"
  # if node.chef-php-extra.module.oauth.attribute?("version")
  #   version "#{node[:chef-php-extra][:module][:oauth][:version]}"
  # end
  action :install
end

execute "oauth_enable" do
  command 'echo -e "; Enable OAuth extension module\nextension=oauth.so" > /etc/php.d/oauth.ini'
  creates "/etc/php.d/oauth.ini"
  action :run
end