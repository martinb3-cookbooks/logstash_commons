# Encoding: utf-8
#
# Cookbook Name:: logstash-commons
#
# Copyright 2014, Rackspace Hosting
#

include_recipe 'logstash-commons::default'

logstash_commons_config 'input_nginx' do
  variables(path: "#{node['nginx']['log_dir']}/**log")
end