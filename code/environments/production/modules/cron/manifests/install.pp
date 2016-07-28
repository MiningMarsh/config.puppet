class cron::install {
  $package = 'vixie-cron'

  package { $package:
    ensure => installed,
  }
}
