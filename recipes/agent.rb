#
# Cookbook Name:: gocd
# Recipe:: agent
#
# Copyright (C) 2015 thenathanjones
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'java'

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

service 'go-agent' do
  action [:enable, :start]
end