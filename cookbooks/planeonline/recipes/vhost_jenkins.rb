include_recipe "apache2"

web_app "jenkins" do
  template "jenkins.conf.erb"	
  server_name "jenkins.planeonline.local"
  server_aliases ["ci.planeonline.local"] 
end

bash "symlink_jobs" do    
  user "root"
  code <<-EOL  
  ln -s /projects/jenkins/jobs /home/vagrant/jobs  
  chown vagrant /home/vagrant/jobs 
  EOL
  not_if {File.exists?("~/jobs")}
end