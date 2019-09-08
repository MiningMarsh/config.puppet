class openrc {
  require run

  $prefix = '/etc/monit.d' 
  $lib = '/var/lib/monit' 
  $config = '/etc/monitrc'

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

  run::entry { 'monit-reload':
    command => 'monit reload',
    period  => hourly
  }
}
