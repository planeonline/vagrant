include_recipe "apache2"

yum_package "gitweb" do
  action :install
end

web_app "git" do
  template "git.conf.erb"	
  server_name "git.planeonline.local"
  server_aliases ["repo.planeonline.local"] 
  docroot "/var/www/git"
end
