# Name of the role should match the name of the file
name "www-planeonline-co-uk"

override_attributes(
    "apache" => {
        # "default_modules" => ["proxy"],
        "contact" => 'abn@webit4.me',
        "listen_ports" => ["80", "443"]                
    },
    "mysql" => {        
        "server_root_password" => 'abn',        
        "server_repl_password" => 'abn'        
    },
    "php" => {
        "ini_settings" => {
            "error_reporting" => 'E_ALL',
            "display_errors" => 'On',
            "phar.readonly" => '0',
            "date.timezone" => 'Europe/London'
        },
        "directives" =>{
            "error_reporting" => 'E_ALL',
            "display_errors" => 'On'        
        },
        "ius"  => '5.4',        
        "devel" => true,
        "install_method" => "source",         
    },
    "phpunit" => {
        "version" => '4.0.14',
    },
    "PHP_CodeSniffer" => {
        "version" => '2.0.0a2',
    },
    "java" => {
        "jdk_version" => "7",
    },
    "jenkins" => {
        "master" => {
            "install_method" => "package",
            "group" => "apache",
            "home" => "/projects/jenkins",
            "logs" => "/projects/logs"
        }
    }
)

# Run list function we mentioned earlier
run_list(        
    "recipe[mysql::server]",
    "recipe[mysql::client]",    
    "recipe[vim]",
    "recipe[java]",
    "recipe[jenkins::master]",    
    "recipe[yum-ius]",    
    "recipe[apache2]",
    "recipe[apache2::mod_cgi]",
    "recipe[apache2::mod_info]",
    "recipe[apache2::mod_ssl]",
    "recipe[apache2::mod_proxy]",
    "recipe[apache2::mod_proxy_http]",    
    "recipe[chef-php-extra]",
    "recipe[chef-php-extra::module_mysql]",
    "recipe[chef-php-extra::module_mbstring]",
    "recipe[chef-php-extra::xdebug]",
    "recipe[chef-php-extra::PHPUnit]",
    "recipe[chef-php-extra::PHP_CodeSniffer]",
    "recipe[phalconphp]",
    "recipe[planeonline::db]",
    "recipe[planeonline::composer]",
    "recipe[planeonline::behat]",
    "recipe[planeonline::vhost_git]",    
    "recipe[planeonline::vhost_jenkins]",    
    "recipe[planeonline::vhost_servicelayer]",
    "recipe[planeonline::vhost_servicelayer_ci]",
    "recipe[planeonline::phinx]",
)
