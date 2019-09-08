class run::install {
  $package = 'vixie-cron'

  package { $package:
    ensure => installed,
  }
}
