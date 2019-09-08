class batch::service {
  require openrc

  openrc::service { "atd":
    category => 'sys-process',
    package => 'at'
  }

  openrc::service { "cgconfig": }
}
