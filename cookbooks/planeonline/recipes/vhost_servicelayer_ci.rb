include_recipe "apache2"

web_app "service-layer-ci" do
  server_name "service-ci.planeonline.local"
  server_aliases ["s-ci.planeonline.local","sl-ci.planeonline.local","service-layer-ci.planeonline.local"]
  allow_override "all"  
  docroot "/projects/jenkins/jobs/service-layer/workspace/service-layer/public"
  directory_index ["index.html","index.htm","index.php"]
  set_env "ENVIRONMENT CI"
end

bash "symlink_service-layer" do    
  user "root"
  code <<-EOL  
  ln -s /projects/www/service-layer /home/vagrant/sl
  EOL
  not_if {File.exists?("/home/vagrant/sl")}
end