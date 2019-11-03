class openrc {
  require run
  require batch

  $prefix = '/etc/monit.d' 
  $lib = '/var/lib/monit' 
  $config = '/etc/monitrc'
  $bashrc = '/etc/portage/bashrc'
  $hookdir = '/etc/portage/puppet'

  package { monit:
    ensure => installed
  }

  file { $lib:
    ensure => directory,
    owner => root,
    group => root,
    mode => '0755'
  } ->

  file { $prefix:
    ensure => directory,
    owner => root,
    group => root,
    mode => '0755'
  } ->

  file { $config:
    content => file('openrc/monitrc'),
    ensure => file,
    owner => root,
    group => root,
    mode => '0700'
  } ->

  service { 'monit':
    ensure => running
  }

  file { $bashrc:
    content => file('openrc/bashrc'),
    ensure => file,
    owner => root,
    group => root,
    mode => '0755' 
  }

  file { $hookdir:
    ensure => directory,
    owner => root,
    group => root,
    mode => '0755'
  }

  batch::entry { 'monit-reload':
    command => 'monit reload',
    period  => daily
  }

  file { '/etc/portage/puppet/app-admin_monit':
    ensure => file,
    content => file('openrc/monit_update'),
    owner => root,
    group => root,
    mode => '0755'
  }
}
