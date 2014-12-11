name              'redis'
maintainer        'LLC Express 42'
maintainer_email  'cookbooks@express42.com'
license           'MIT'
description       'Provides LWRP for managing multiple redis instances.'
version           '0.1.2'

depends           'runit'

supports          'debian'
supports          'ubuntu'

recipe            'redis::default', 'Do nothing.'
