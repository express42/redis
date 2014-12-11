require 'spec_helper'

describe package('redis-server') do
  it { should be_installed }
end

describe file('/etc/redis/redis.conf') do
  it { should_not be_file }
end

describe service('redis') do
  it { should_not be_enabled }
end

describe file('/etc/redis/test1') do
  it { should be_directory }
end

describe file('/var/lib/redis/test1') do
  it { should be_directory }
end

describe file('/etc/redis/test1/redis.conf') do
  it { should be_file }
end

describe service('redis_test1') do
  it { should be_running }
end

describe port(6379) do
  it { should be_listening.on('127.0.0.1').with('tcp') }
end

describe file('/etc/redis/test2') do
  it { should be_directory }
end

describe file('/var/lib/redis/test2') do
  it { should be_directory }
end

describe file('/etc/redis/test2/redis.conf') do
  it { should be_file }
end

describe service('redis_test2') do
  it { should be_running }
end

describe port(6380) do
  it { should be_listening.on('127.0.0.1').with('tcp') }
end
