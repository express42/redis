# Cookbook Name:: redis
# Attributes:: default

# COMMON SETTING
default['redis']['defaults']['bind']                        = "127.0.0.1"
default['redis']['defaults']['port']                        = "6379"
default['redis']['defaults']['daemonize']                   = "yes"
default['redis']['defaults']['timeout']                     = "300"
default['redis']['defaults']['loglevel']                    = "notice"
default['redis']['defaults']['databases']                   = 16

# INSTANCE SPECIFIC
default['redis']['defaults']['config_path']                 = "/etc/redis"
default['redis']['defaults']['data_path']                   = "/var/lib/redis"
default['redis']['defaults']['pid_path']                    = "/var/run/redis"
default['redis']['defaults']['log_path']                    = "/var/log/redis"

# SNAPSHOTTING
default['redis']['defaults']['save']                        = [ [900, 1], [300, 10], [60, 10000] ]
default['redis']['defaults']['rdbcompression']              = "yes"
default['redis']['defaults']['dbfilename']                  = "dump.rdb"
default['redis']['defaults']['dir']                         = "/var/lib/redis"

# REPLICATION
default['redis']['defaults']['slaveof']                     = nil
default['redis']['defaults']['masterauth']                  = nil
# SECURITY
default['redis']['defaults']['password']                    = nil
# LIMITS
default['redis']['defaults']['maxclients']                  = "128"
default['redis']['defaults']['maxmemory']                   =  nil
default['redis']['defaults']['maxmemory-policy']            = "volatile-lru"

# APPEND ONLY MODE
default['redis']['defaults']['appendonly']                  = "no"
default['redis']['defaults']['appendfsync']                 = "always"
default['redis']['defaults']['slave-serve-stale-data']      = "no"
default['redis']['defaults']['no-appendfsync-on-rewrite']   = "yes"
default['redis']['defaults']['auto-aof-rewrite-percentage'] = 100
default['redis']['defaults']['auto-aof-rewrite-min-size']   = "128mb"

# ADVANCED CONFIG
default['redis']['defaults']['hash-max-ziplist-entries']     = 512
default['redis']['defaults']['hash-max-ziplist-value']       = 64
default['redis']['defaults']['list-max-ziplist-entries']    = 512
default['redis']['defaults']['list-max-ziplist-value']      = 64
default['redis']['defaults']['set-max-intset-entries']      = 512
default['redis']['defaults']['zset-max-ziplist-entries']    = 128
default['redis']['defaults']['zset-max-ziplist-value']      = 64
default['redis']['defaults']['activerehashing']             = "yes"
