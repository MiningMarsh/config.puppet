# Defines a batch entry to be run at a specified period.
define openrc::service (

  # What state to make sure the service is in.
  String $ensure = running,

  # Whether the service has restart support.
  Boolean $hasrestart = true,

  # Whether the service has status support.
  Boolean $hasstatus = true,

  # If provided, given file will be monitored by monit to restart the service 
  # after upgrades.
  Optional[String] $monitor = undef

) {
  require openrc

  service { $title:
    ensure => $ensure,
    hasrestart => $hasrestart,
    hasstatus => $hasstatus
  }

  if $monitor != undef {
    file { "${openrc::prefix}/puppet_${title}":
      content => template('openrc/service.erb'),
      ensure => file
    }
  }
} 
