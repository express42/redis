# Usage

Include ```recipe[redis]``` in node runlist or add as dependency.
Recipe will remove ```/etc/redis/redis.conf``` and disable default ```redis-server``` initialization.

We use runit instead of init scripts for reasons.

```
redis "cluster-name" do
  configuration(
    :bind => "127.0.0.1",
    :maxclients => 256
  )
end
```
