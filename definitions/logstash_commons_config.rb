# This defintion is designed to remove the repetition used throughout this cookbook.

define :logstash_commons_config, variables: {}, instance_name: nil, template_name: nil, template_source_file: nil, template_source_cookbook: nil, action: nil do

  params[:action] ||= :create
  params[:instance_name] ||= node['logstash_commons']['instance_name']
  params[:template_name] ||= "#{params[:name]}.conf"
  params[:template_source_file] ||= "#{params[:name]}.conf.erb"
  params[:template_source_cookbook] ||= 'logstash_commons'

  logstash_config params[:instance_name] do
    templates_cookbook params[:template_source_cookbook]
    templates(params[:template_name] => params[:template_source_file])
    variables params[:variables]
    # this is a trick to ensure the notification doesn't hurt us, if the logstash
    # cookbook is not currently available/included on this node
    begin
      resources("logstash_service[#{node['logstash_commons']['service_name']}]");
      if node['logstash_commons']['restart_service']
        notifies :restart, "logstash_service[#{node['logstash_commons']['service_name']}]", :delayed
      end
    rescue Chef::Exceptions::ResourceNotFound
      Chef::Log.warn("Could not find logstash_service[#{node['logstash_commons']['service_name']}], will not notify it to restart")
    end
    action params[:action]
  end
end
