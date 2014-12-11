include_recipe 'redis'

redis 'test1' do
  configuration(
    bind: '127.0.0.1',
    port: 6379
  )
end

redis 'test2' do
  configuration(
    bind: '127.0.0.1',
    port: 6380
  )
end
