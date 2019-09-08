class run::service {
  require openrc
  openrc::service { $run::install::package: 
    category => $run::install::category,
    package => $run::install::package,
    service => $run::install::package
  }
}
