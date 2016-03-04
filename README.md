Description
===========

Installs some essential tools like wget, curt, htop, tmux etc. Also it installs useful scripts like
freemem.sh that can be used to unswap. Also it modifies /etc/hosts and can add custom host records
through attributes.

Requirements
============

User cookbook must be present so node[:user] is set. 

Attributes
==========

You can configure custom hosts record using hosts_records hash attribute.
default[:hosts_records] = { '192.168.0.1' => 'gateway gateway.example.com' }

You can add custom tmux config lines by adding new records like this
default[:tmux][:tmux_records] = [ 'test', 'second' ]

Usage
=====

Simply include essential_tools to you runlist.
