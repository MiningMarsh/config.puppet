class openrc {
  require run

  $prefix = '/etc/monit.d' 
  $lib = '/var/lib/monit' 
  $config = '/etc/monitrc'

  package { monit:
    ensure => installed
  }

  file { $lib:
    ensure => directory
  } ->

  file { $prefix:
    ensure => directory
  } ->

  file { $config:
    content => file('openrc/monitrc'),
    ensure => file
  } ->

  service { 'monit':
    ensure => running
  }

  run::entry { 'monit-reload':
    command => 'monit reload',
    period  => hourly
  }
}
