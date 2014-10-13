if defined?(ChefSpec)
  def create_logstash_config(resource)
    ChefSpec::Matchers::ResourceMatcher.new(:logstash_config, :create, resource)
  end
end
