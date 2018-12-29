class package::install {

  $packages = [
    'polkit'
  ]

  $packages.each |String $package| {
    package { $package:
      ensure => installed,
    }
  }
}
