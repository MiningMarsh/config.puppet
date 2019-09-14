# OpenRC wrapper for declaring a service that is to be run and upgraded.
define openrc::service (

  # What state to make sure the service is in.
  String $ensure = running,

  # Whether the service has restart support.
  Boolean $hasrestart = true,

  # Whether the service has status support.
  Boolean $hasstatus = true,

  # If provided, category will be used for restarting services on package
  # recompile.
  Optional[String] $category = undef,

  # If provided, package will be used for restarting services on package 
  # recompile.
  String $package = $title,

  # If provided, given file will be monitored by monit to restart the service 
  # after upgrades.
  Optional[String] $monitor = undef,

  # Defines the service name to restart.
  String $service = $title

) {
  require openrc

  service { $title:
    ensure => $ensure,
    hasrestart => $hasrestart,
    hasstatus => $hasstatus,
    enable => true
  }

  if $package != undef {
    if $category != undef {
      file { "${openrc::hookdir}/${category}_${package}":
        content => template('openrc/portage.erb'),
        ensure => file,
        owner => root,
        group => root,
        mode => '0755'
      }

      package { "${category}/${package}":
        ensure => installed
      }
    }
  }

  if $monitor != undef {
    file { "${openrc::prefix}/puppet_service_${title}":
      content => template('openrc/service.erb'),
      ensure => file
    }
  }
} 
