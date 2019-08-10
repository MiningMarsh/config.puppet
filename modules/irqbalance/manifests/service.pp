class irqbalance::service {
  service { 'irqbalance':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
