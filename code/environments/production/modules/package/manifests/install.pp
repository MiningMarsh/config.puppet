class package::install {

  $packages = [
    'eix',
    'gentoolkit',
    'gentoolkit-dev',
    'layman',
    'portage',
    'portage-utils',
    'smart-live-rebuild',
  ]

  $packages.each |String $package| {
    package { $package:
      ensure => installed,
    }
  }
}
