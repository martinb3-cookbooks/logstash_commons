# Encoding: utf-8
#
# Cookbook Name:: logstash-commons
#
# Copyright 2014, Rackspace Hosting
#

include_recipe 'logstash-commons::default'

logstash_commons_config 'input_postgresql' do
  variables(path: "#{node['postgresql']['config']['log_directory']}/**log")
end
