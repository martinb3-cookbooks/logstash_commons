# logstash-commons

Provides a common repository of logstash recipes for various technologies that produce logs. All of the recipes here call `logstash_config` from the upstream lusis/chef-logstash and use that to configure the logs to be sent to logstash for that particular technology. The hope is that you would eventually be able to simply include logstash, apache2, and logstash-commons::apache, and have a fully working apache2 and logstash server that can parse Apache logs.

## [Changelog](CHANGELOG.md)

See CHANGELOG.md for additional information about changes to this stack over time.

## Supported Platforms

Ubuntu 12.04

Ubuntu 14.04

CentOS 6.5

## Attributes

Please describe any attributes exposed by this stack, and what the default values are. There shouldn't be any attributes without a default value (e.g. no required attributes, sensible defaults).

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['logstash-commons']['instance_name']</tt></td>
    <td>String</td>
    <td>name of logstash_instance</td>
    <td><tt>'default''</tt></td>
  </tr>
  <tr>
    <td><tt>['logstash-commons']['service_name']</tt></td>
    <td>Boolean</td>
    <td>name of logstash_service</td>
    <td><tt>'default'</tt></td>
  </tr>
  <tr>
    <td><tt>['logstash-commons']['restart_service']</tt></td>
    <td>Boolean</td>
    <td>whether to restart logstash when templates are acted upon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### logstash-commons::default

Does nothing.

### logstash-commons::*

Each recipe configures a logstash_config for the default logging location and default log patterns for an upstream cookbook or service of that name. For example, logstash-commons::apache uses the upstream apache2 cookbook attributes to configure logstash to watch and parse any logs.

## Contributing

See [CONTRIBUTING](https://github.com/AutomationSupport/logstash-commons/blob/master/CONTRIBUTING.md).

## Authors

Author:: Rackspace (devops-chef@rackspace.com)

## License
```
# Copyright 2014, Rackspace Hosting
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
```
