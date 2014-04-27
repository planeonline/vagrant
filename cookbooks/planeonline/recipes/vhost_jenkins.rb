include_recipe "apache2"

web_app "jenkins" do
  template "jenkins.conf.erb"	
  server_name "jenkins.planeonline.local"
  server_aliases ["ci.planeonline.local"] 
end
