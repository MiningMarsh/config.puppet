class batch::service {
  service { "atd":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  service { "cgconfig":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
