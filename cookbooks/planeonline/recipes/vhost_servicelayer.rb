include_recipe "apache2"

web_app "service-layer" do
  server_name "service.planeonline.local"
  server_aliases ["s.planeonline.local","sl.planeonline.local","service-layer.planeonline.local"]
  allow_override "all"  
  docroot "/projects/www/service-layer/public"
  directory_index ["index.html","index.htm","index.php"]
  set_env "ENVIRONMENT DEV"
end

bash "symlink_service-layer" do    
  user "root"
  code <<-EOL  
  ln -s /projects/www/service-layer /home/vagrant/sl
  EOL
  not_if {File.exists?("/home/vagrant/sl")}
end