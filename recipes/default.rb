#
# Cookbook Name:: essential_tools
# Recipe:: default
#
# Copyright 2012, Ares
#
# All rights reserved - Do Not Redistribute
#

package "htop"
package "wget"
package "curl"
package "vim"
package "psmisc"
package "strace"
package "lsof"
package "mtr"
package "tree"
package "tmux"
package "mc"
package "util-linux"

if platform?('debian', 'ubuntu')
  package "bind9-host"
elsif platform?('redhat', 'fedora', 'centos')
  package "bind-utils"
end

template "/etc/hosts" do
  source "hosts.erb"
  mode "0644"
end

cookbook_file "/usr/local/bin/freemem.sh" do
  source "freemem.sh"
  mode 0755
  owner node[:user] 
  group node[:user]
end

file "/home/#{node[:user]}/.gemrc" do
  owner node[:user]
  group node[:user]
  mode 0644
  action :create
  content %q(gem: --no-rdoc --no-ri)
end

file "/etc/gemrc" do
  mode 0644
  action :create
  content %q(gem: --no-rdoc --no-ri)
end

if platform?('debian', 'ubuntu')
  package "cron-apt"
end

template '/etc/tmux.conf' do
  source 'tmux.conf'
end

group "staff" do
  members node[:user]
end

# place to install custom sw from source
directory "/usr/local/src/" do
  group "staff"
  mode "2775"
end
