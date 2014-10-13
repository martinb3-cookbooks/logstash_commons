# Encoding: utf-8
#
# Cookbook Name:: logstash_commons
#
# Copyright 2014, Rackspace Hosting
#

include_recipe 'logstash_commons::default'

logstash_commons_config 'input_rabbitmq' do
  variables(path: '/var/log/rabbitmq/**')
end
