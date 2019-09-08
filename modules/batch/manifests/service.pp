class batch::service {
  require openrc

  openrc::service { "atd": }

  openrc::service { "cgconfig": }
}
