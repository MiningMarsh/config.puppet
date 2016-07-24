class run {
  $package = 'vixie-cron'

  package { $package:
    ensure => installed,
  } ->

  file { "/etc/cron.${run::period::hourly}":
    ensure => directory,
  } ->

  file { "/etc/cron.${run::period::daily}":
    ensure => directory,
  } ->

  file { "/etc/cron.${run::period::weekly}":
    ensure => directory,
  } ->

  file { "/etc/cron.${run::period::monthly}":
    ensure => directory,
  } ~>

  service { $package:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
