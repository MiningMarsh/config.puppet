class defrag::install {
  package { 'e2fsprogs':
    ensure => installed,
  }
}
