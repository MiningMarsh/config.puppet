class fstrim::install {
  package { 'util-linux':
    ensure => installed,
  }
}
