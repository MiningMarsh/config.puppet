class zfs::install {

  $packages = [
    'zfs-auto-snapshot',
  ]

  $packages.each |String $package| {
    package { $package:
      ensure => installed,
    }
  }
}
