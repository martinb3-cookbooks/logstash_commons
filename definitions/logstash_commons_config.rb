# This defintion is designed to remove the repetition used throughout this cookbook.

define :logstash_commons_config, variables: {}, instance_name: nil, template_name: nil, template_source_file: nil, template_source_cookbook: nil, action: nil do

  params[:action] ||= :create
  params[:instance_name] ||= node['logstash-commons']['instance_name']
  params[:template_name] ||= "#{params[:name]}.conf"
  params[:template_source_file] ||= "#{params[:name]}.conf.erb"
  params[:template_source_cookbook] ||= 'logstash-commons'

  logstash_config params[:instance_name] do
    templates_cookbook params[:template_source_cookbook]
    templates(params[:template_name] => params[:template_source_file])
    variables params[:variables]
    if node['logstash-commons']['restart_service']
      notifies :restart, "logstash_service[#{node['logstash-commons']['service_name']}]", :delayed
    end
    action params[:action]
  end
end
