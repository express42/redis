# Description

Provides LWRP for managing multiple redis instances.

# Requirements

## Platform:

* Debian
* Ubuntu

## Cookbooks:

* runit

# Attributes

* `node['redis']['defaults']['bind']` -  Defaults to `"127.0.0.1"`.
* `node['redis']['defaults']['port']` -  Defaults to `"6379"`.
* `node['redis']['defaults']['daemonize']` -  Defaults to `"yes"`.
* `node['redis']['defaults']['timeout']` -  Defaults to `"300"`.
* `node['redis']['defaults']['loglevel']` -  Defaults to `"notice"`.
* `node['redis']['defaults']['databases']` -  Defaults to `"16"`.
* `node['redis']['defaults']['config_path']` -  Defaults to `"/etc/redis"`.
* `node['redis']['defaults']['data_path']` -  Defaults to `"/var/lib/redis"`.
* `node['redis']['defaults']['pid_path']` -  Defaults to `"/var/run/redis"`.
* `node['redis']['defaults']['log_path']` -  Defaults to `"/var/log/redis"`.
* `node['redis']['defaults']['save']` -  Defaults to `"[ ... ]"`.
* `node['redis']['defaults']['rdbcompression']` -  Defaults to `"yes"`.
* `node['redis']['defaults']['dbfilename']` -  Defaults to `"dump.rdb"`.
* `node['redis']['defaults']['dir']` -  Defaults to `"/var/lib/redis"`.
* `node['redis']['defaults']['slaveof']` -  Defaults to `"nil"`.
* `node['redis']['defaults']['masterauth']` -  Defaults to `"nil"`.
* `node['redis']['defaults']['password']` -  Defaults to `"nil"`.
* `node['redis']['defaults']['maxclients']` -  Defaults to `"128"`.
* `node['redis']['defaults']['maxmemory']` -  Defaults to `"nil"`.
* `node['redis']['defaults']['maxmemory-policy']` -  Defaults to `"volatile-lru"`.
* `node['redis']['defaults']['appendonly']` -  Defaults to `"no"`.
* `node['redis']['defaults']['appendfsync']` -  Defaults to `"always"`.
* `node['redis']['defaults']['slave-serve-stale-data']` -  Defaults to `"no"`.
* `node['redis']['defaults']['no-appendfsync-on-rewrite']` -  Defaults to `"yes"`.
* `node['redis']['defaults']['auto-aof-rewrite-percentage']` -  Defaults to `"100"`.
* `node['redis']['defaults']['auto-aof-rewrite-min-size']` -  Defaults to `"128mb"`.
* `node['redis']['defaults']['hash-max-ziplist-entries']` -  Defaults to `"512"`.
* `node['redis']['defaults']['hash-max-ziplist-value']` -  Defaults to `"64"`.
* `node['redis']['defaults']['list-max-ziplist-entries']` -  Defaults to `"512"`.
* `node['redis']['defaults']['list-max-ziplist-value']` -  Defaults to `"64"`.
* `node['redis']['defaults']['set-max-intset-entries']` -  Defaults to `"512"`.
* `node['redis']['defaults']['zset-max-ziplist-entries']` -  Defaults to `"128"`.
* `node['redis']['defaults']['zset-max-ziplist-value']` -  Defaults to `"64"`.
* `node['redis']['defaults']['activerehashing']` -  Defaults to `"yes"`.

# Recipes

* postfix::default - Do nothing

# LWRP

### Attribute Parameters

<table>
<th>Attribute</th>
<th>Description</th>
<th>Default</th>
<tr>
<td>cluster name</td>
<td>also used as files path extension</td>
<td>required (name attr)</td>
</tr>
<tr>
<td>configuration</td>
<td>hash with instance configuration</td>
<td>see default values in cookbook attributes</td>
</tr>
</table>


# Usage

Include ```recipe[redis]``` in node runlist or add as dependency

```
redis "cluster-name" do
  configuration(
    :bind => "127.0.0.1",
    :maxclients => 256
  )
end
```


# License and Maintainer

Maintainer:: LLC Express 42 (<info@express42.com>)

License:: MIT
