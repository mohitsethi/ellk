
def get_cluster_nodes(_role=nil)
  unless _role.nil?
    _nodes = search(:node,
                      "chef_environment:#{node.chef_environment} AND 
                       role:#{_role}",
                    :filter_result => {'ipaddress' => ['ipaddress']})
  else
    Chef::Application.fatal!("Didn't expect cluster role to be empty!", 42)
  end
  return _nodes
end