class run::install {
  $package = 'cronie'

  package { $package:
    ensure => installed,
  }
}
