# Encoding: utf-8
#
# Cookbook Name:: logstash_commons
#
# Copyright 2014, Rackspace Hosting
#

include_recipe 'logstash_commons::default'
include_recipe 'chef-sugar'

logstash_commons_config 'input_postgresql' do
  variables(path: "#{node.deep_fetch('postgresql', 'config', 'log_directory')}/**log")
end
