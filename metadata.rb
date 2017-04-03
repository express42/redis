name              'redis'
maintainer        'LLC Express 42'
maintainer_email  'cookbooks@express42.com'
license           'MIT'
description       'Provides LWRP for managing multiple redis instances.'
chef_version      '>= 12'
version           '0.1.2'
source_url 'https://github.com/express42-cookbooks/redis' if respond_to?(:source_url)
issues_url 'https://github.com/express42-cookbooks/redis/issues' if respond_to?(:issues_url)

depends           'runit'

supports          'debian'
supports          'ubuntu'

recipe            'redis::default', 'Do nothing.'
