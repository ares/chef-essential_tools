name             "essential_tools"
maintainer       "Ares"
maintainer_email "ar3s.cz@gmail.com"
license          "All rights reserved"
description      "Installs/Configures essential_tools"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.4.2"

depends	'user', '>= 0.1.0'

attribute 'hosts_record',
          :display_name => 'Hosts record',
          :description => 'Custom records in hosts file',
          :type => 'hash',
          :required => 'optional',
          :default => '{}'

attribute 'tmux',
          :display_name => 'Tmux configuration',
          :description => 'Tmux configuration, you can customize config_lines in tmux.conf',
          :type => 'hash',
          :required => 'optional',
          :default => '{ :tmux_configs => [] }'
