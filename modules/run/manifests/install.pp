class run::install {
  $package = 'vixie-cron'
  $category = 'sys-process'

  package { $package:
    ensure => installed,
  }
}
