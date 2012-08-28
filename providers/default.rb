#
# Cookbook Name:: redis
# Provider:: default
#
# Author:: LLC Express 42 (info@express42.com)
#
# Copyright (C) LLC 2012 Express 42
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

action :create do

  redis_package = package "redis-server" do
    action :nothing
  end

  configuration = Chef::Mixin::DeepMerge.merge(node.redis.defaults.to_hash, new_resource.configuration)

  configuration_template = template "/etc/redis/redis.conf" do
    action :nothing
    source "redis.conf.erb"
    owner "redis"
    group "redis"
    mode 0640
    variables :configuration => configuration
    if new_resource.cookbook
      cookbook new_resource.cookbook
    else
      cookbook "redis"
    end
  end

  redis_service = service "redis-server" do
    supports :status => true, :restart => true, :reload => true
    action :enable
  end

  redis_package.run_action(:install)
  configuration_template.run_action(:create)
  if configuration_template.updated_by_last_action?
    redis_service.run_action(:restart)
    @new_resource.updated_by_last_action(true)
  end

end
