class run::service {
  require openrc

  openrc::service { $run::install::package: 
    service => $run::install::package
  }
}
