# Defines a binary to run as a deamon and to monitor to restart on binary 
# upgrade
define openrc::daemon (

  # Binary to run
  String $binary = "/usr/bin/${title}",

  # Arguments to pass.
  String $arguments = undef

) {
  require openrc

  include zsh
  $stdlib = zsh::stdlib()

  init::script { $title:
    content => template('openrc/init.erb')
  }


  file { "${openrc::prefix}/puppet_daemon_${title}":
    content => template('openrc/daemon.erb'),
    ensure => file
  }
} 
