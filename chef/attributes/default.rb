#
# Cookbook Name:: mariadb
# Attribute:: default
#

default['mariadb']['version'] = "5.5"
default['mariadb']['oqgraph'] = false
default['mariadb']['oqgraph_install_file']= "/tmp/install_oqgraph.sql"

# MariaDB doesn't use upstart like vanilla MySQL does.
normal['mysql']['use_upstart'] = false

normal['mysql']['client']['packages'] = %W{mariadb-client libmariadbclient-dev}
normal['mysql']['server']['packages'] = %W{mariadb-server}

