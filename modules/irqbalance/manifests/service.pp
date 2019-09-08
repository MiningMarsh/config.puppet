class irqbalance::service {
  require openrc
  openrc::service { 'irqbalance':
    category => 'sys-apps'
  }
}
