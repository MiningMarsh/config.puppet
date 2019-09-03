class irqbalance::service {
  require openrc
  openrc::service { 'irqbalance':
    monitor => '/usr/sbin/irqbalance'
  }
}
