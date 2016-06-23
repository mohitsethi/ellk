class Chef
  class Provider
    class ElasticsearchPlugin < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)
      provides :elasticsearch_plugin if Chef::Provider.respond_to?(:provides)
      service_name = 'elasticsearch'

      action :install do
        home_dir = "#{new_resource.path}/elasticsearch-#{new_resource.version}"
        if new_resource.version >= "2"
          execute "install plugin #{new_resource.name}" do
            user new_resource.user
            group new_resource.group
            command "#{home_dir}/bin/plugin install #{new_resource.name}"
          end
        else
          execute "install plugin #{new_resource.name}" do
            user new_resource.user
            group new_resource.group
            command "#{home_dir}/bin/plugin -install #{new_resource.name}"
          end
        end
      end

      action :remove do
        home_dir = "#{new_resource.path}/elasticsearch-#{new_resource.version}"
        if new_resource.version >= "2"
          execute "remove plugin #{new_resource.name}" do
            user new_resource.user
            group new_resource.group
            command "#{home_dir}/bin/plugin remove #{new_resource.name}"
          end
        else
          execute "remove plugin #{new_resource.name}" do
            user new_resource.user
            group new_resource.group
            command "#{home_dir}/bin/plugin -remove #{new_resource.name}"
          end
        end
      end
    end
  end
end
