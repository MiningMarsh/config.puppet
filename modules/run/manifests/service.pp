class run::service {
  require openrc
  openrc::service { $run::install::package: 
    monitor => '/usr/sbin/cron'
  }
}
