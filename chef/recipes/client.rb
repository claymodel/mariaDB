#
# Cookbook Name:: mariadb
# Recipe:: client
#

include_recipe "mariadb::mariadb_repo"
include_recipe "mysql::client"
