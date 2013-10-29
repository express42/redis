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

  package "redis-server" do
    action :install
  end
 
  # Remove default config and service initialization on system boot
  file "/etc/redis/redis.conf" do
    action :delete
    only_if "test -f /etc/redis/redis.conf"
  end

  service "redis-server" do
    action [:disable, :stop]
  end

  configuration = Chef::Mixin::DeepMerge.merge(node['redis']['defaults'].to_hash, new_resource.configuration)

  if new_resource.configuration.has_key?('save') and new_resource.configuration['save'].empty?
    configuration['save'] = []
  end

  # Variables
  cluster_name = new_resource.cluster_name
  pid_file = "#{configuration[:pid_path]}/redis-#{cluster_name}.pid"
  data_dir = "#{configuration[:data_path]}/#{cluster_name}"
  log_file = "#{configuration[:log_path]}/redis-#{cluster_name}.log"

  configuration['pidfile'] = pid_file
  configuration['dir'] = data_dir
  configuration['logfile'] = log_file

  # Override this because we use runit to control the instance
  configuration['daemonize'] = "no"

  cluster_conf_dir = directory "/etc/redis/#{cluster_name}" do
    owner "redis"
    group "redis"
    action :create
  end

  cluster_data_dir = directory data_dir do
    owner "redis"
    group "redis"
    action :create
  end

  configuration_template = template "/etc/redis/#{cluster_name}/redis.conf" do
    action :create
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

  runit_service "redis_#{cluster_name}" do
    cookbook "redis"
    log_template_name "redis"
    run_template_name "redis"
    options :cluster_name => cluster_name,
            :pid_file => pid_file
  end

  if configuration_template.updated_by_last_action?
    @new_resource.updated_by_last_action(true)
  end

end
