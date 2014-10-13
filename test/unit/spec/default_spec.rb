# Encoding: utf-8

require_relative 'spec_helper'

# this will pass on logstash_commons, fail elsewhere, forcing you to
# write those chefspec tests you always were avoiding
describe 'logstash_commons::apache' do
  before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::Runner.new(platform: platform, version: version) do |node|
            node.set['logstash_commons']['restart_service'] = false # need logstash cookbook to do this
            node.set['logstash_commons']['instance_name'] = 'agent'
          end.converge(described_recipe)
        end

        _property = load_platform_properties(platform: platform, platform_version: version)

        it 'creates a logstash_config' do
          expect(chef_run).to create_logstash_config('agent')
        end
      end
    end
  end
end
