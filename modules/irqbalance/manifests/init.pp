class irqbalance {
  openrc::service { 'irqbalance':
    category => 'sys-apps'
  }
}
