include_recipe "apache2"

web_app "presentation-layer" do
  server_name "presentation.planeonline.local"
  server_aliases ["p.planeonline.local","pl.planeonline.local","presentation-layer.planeonline.local"]
  allow_override "all"  
  docroot "/projects/www/presentation-layer/public"
  directory_index ["index.html","index.htm","index.php"]
  set_env "ENVIRONMENT DEV"
end

bash "symlink_presentation-layer" do    
  user "root"
  code <<-EOL  
  ln -s /projects/www/presentation-layer /home/vagrant/pl
  EOL
  not_if {File.exists?("/home/vagrant/pl")}
end