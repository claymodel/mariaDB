#
# Cookbook Name:: mariadb
# Recipe:: default
#

include_recipe "mariadb::mariadb_repo"
include_recipe "mysql::server"

if node['mariadb']['oqgraph']

cookbook_file node['mariadb']['oqgraph_install_file'] do
   case node["platform_family"]
when "debian"
source "install_oqgraph.sql"
end
  owner "root"
  group "root"
  mode "0600"
end

execute "mariadb-install-oqgraph" do
   
   command "mysql -u root -p#{node['mysql']['server_root_password']} < #{node['mariadb']['oqgraph_install_file']}"
   action :run
   only_if { `/usr/bin/mysql -u root -p#{node['mysql']['server_root_password']} -D mysql -r -B -N -e \"SELECT count(*) from information_schema.ENGINES e where e.ENGINE = 'OQGRAPH'"`.to_i == 0 }
end

end

