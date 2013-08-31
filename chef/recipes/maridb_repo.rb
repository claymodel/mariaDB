#
# Cookbook Name:: mariadb
# Recipe:: mariadb_repo
#

include_recipe "apt"

apt_repository "mariadb" do
  platform = node['platform']
  unless ['debian', 'ubuntu'].include?(platform)
    raise "Unsupported platform: #{platform}"
  end
  uri "http://mirrors.supportex.net/mariadb/repo/#{node[:mariadb][:version]}/#{node[:platform]}"
  distribution node['lsb']['codename']
  components ['main']
  keyserver "keyserver.ubuntu.com"
  key "0xcbcb082a1bb943db"
  action :add
  notifies :run, resources(:execute => "apt-get update"), :immediately
end

