class irqbalance {

  include irqbalance::install
  include irqbalance::service

  Class['batch::install'] ->
  Class['batch::service']
}
