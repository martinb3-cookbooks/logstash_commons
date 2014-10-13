# Encoding: utf-8
name             'logstash-commons'
maintainer       'Rackspace'
maintainer_email 'rackspace-cookbooks@rackspace.com'
license          'Apache 2.0'
description      'Installs/Configures logstash-commons'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt'
depends 'yum'
depends 'logstash', '~> 0.9'
