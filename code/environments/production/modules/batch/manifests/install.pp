class batch::install {
  $package = 'at'

  package { $package:
    ensure => installed,
  }
}
