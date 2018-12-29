class batch::service {
  service { "${batch::install::package}d":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
