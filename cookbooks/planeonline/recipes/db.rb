#
# Cookbook Name:: ./planeonline
# Recipe:: db
#
# Copyright 2014, Takeaway IT Ltd.
#
# All rights reserved - Do Not Redistribute
#

bash 'setup_phalconphp_db' do
  user "root"
  code <<-EOL
  service mysqld restart
  mysql -u root -pabn -e "CREATE SCHEMA planeonline DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci";
  mysql -u root -pabn -e "GRANT ALL ON planeonline.* TO 'planeuser'@'localhost' IDENTIFIED BY 'planepass'";

  mysql -u root -pabn -e "CREATE SCHEMA planeonline_dev DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci";
  mysql -u root -pabn -e "GRANT ALL ON planeonline_dev.* TO 'planeuser_dev'@'localhost' IDENTIFIED BY 'planepass'";

  mysql -u root -pabn -e "CREATE SCHEMA planeonline_test DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci";
  mysql -u root -pabn -e "GRANT ALL ON planeonline_test.* TO 'planeuser_test'@'localhost' IDENTIFIED BY 'planepass'";

  mysql -u root -pabn -e "CREATE SCHEMA planeonline_ci DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci";
  mysql -u root -pabn -e "GRANT ALL ON planeonline_ci.* TO 'planeuser_ci'@'localhost' IDENTIFIED BY 'planepass'";

  mysql -u root -pabn -e "CREATE SCHEMA planeonline_ci_test DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci";
  mysql -u root -pabn -e "GRANT ALL ON planeonline_ci_test.* TO 'planeuser_ci_test'@'localhost' IDENTIFIED BY 'planepass'";
  EOL
end

