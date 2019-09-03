class batch::service {
  require openrc

  openrc::service { "atd":
    monitor => '/usr/sbin/atd'
  }

  openrc::service { "cgconfig": }
}
