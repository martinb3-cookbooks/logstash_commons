# Encoding: utf-8
#
# Cookbook Name:: logstash_commons
#
# Copyright 2014, Rackspace Hosting
#

include_recipe 'logstash_commons::default'
include_recipe 'chef-sugar'

logstash_commons_config 'input_nginx' do
  variables(path: "#{node.deep_fetch('nginx', 'log_dir')}/**log")
end
