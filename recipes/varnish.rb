# Encoding: utf-8
#
# Cookbook Name:: logstash_commons
#
# Copyright 2014, Rackspace Hosting
#

include_recipe 'logstash_commons::default'

logstash_commons_config 'input_varnish' do
  variables(path: '/var/log/varnish/**')
end
