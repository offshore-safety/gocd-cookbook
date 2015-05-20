#
# Cookbook Name:: gocd
# Recipe:: agent
#
# Copyright (C) 2015 thenathanjones
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'gocd::jre'

package 'git'
package 'svn'

include_recipe 'gocd::setup_repository'

ruby_block 'disable autostart' do
  block do
    ENV['DO_NOT_START_SERVICE'] = 'Y'
  end
end

package 'go-agent'

ruby_block 'enable autostart' do
  block do
    ENV.delete 'DO_NOT_START_SERVICE'
  end
end

template '/etc/default/go-agent' do
  source 'go-agent.erb'
  mode '0644'
  owner 'go'
  group 'go'
end

directory '/var/lib/go-agent/config' do
  owner 'go'
  group 'go'
  mode  '0750'
  recursive true
end

template '/var/lib/go-agent/config/autoregister.properties' do
  source 'autoregister.properties.erb'
  mode '0600'
  owner 'go'
  group 'go'
end

http_request 'verify server up' do
  url "http://#{node[:gocd][:server][:host]}:#{node[:gocd][:server][:http_port]}/go/home"
  retry_delay 10
  retries 10
  action :nothing
end

service 'go-agent' do
  action [:enable, :start]
end