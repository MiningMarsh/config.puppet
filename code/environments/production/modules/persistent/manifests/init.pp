class persistent {

  $lib = '/usr/local/puppet'

  file { $lib:
    ensure => directory,
  }
}
