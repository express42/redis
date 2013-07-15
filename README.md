Redis Cookbook
======================

Install and configure redis key-value store.

## Warning

Cookbook will remove ```/etc/redis/redis.conf``` and disable default ```redis-server``` initialization.

We use runit instead of init scripts for reasons.

## Requirements

Depends on ```runit``` cookbook.

This cookbook version (0.1.1) tested only on Debian squeeze and Ubuntu 12.04.

## Usage

Include ```recipe[redis]``` in node runlist or add as dependency

```
redis "cluster-name" do
  configuration(
    :bind => "127.0.0.1",
    :maxclients => 256
  )
end
```

## Resources/Providers

### Attribute Parameters

<table>
  <th>Attribute</th>
  <th>Description</th>
  <th>Default</th>
  <tr>
    <td>cluster name</td>
    <td>used as path for instance files</td>
    <td>required (name attr)</td>
  </tr>
  <tr>
    <td>configuration</td>
    <td>hash with instance configuration</td>
    <td>default values in cookbook attributes</td>
  </tr>
</table>

License and Author
==================

Author:: Express 42 (<info@express42.com>)

Copyright (C) 2012-2013 LLC Express 42

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

