class run::config {

  file { '/etc/crontab':
    ensure => absent,
  }

  $persistent_directory = persistent::directory('cron', 'cron')

  $run_and_remove_lock_name = 'cron-run-and-remove-lock'
  script::install { $run_and_remove_lock_name:
    content => file('run/run-and-remove-lock'),
  }
  $run_and_remove_lock = script::path($run_and_remove_lock_name)

  script::install { 'run-crons':
    content => template('run/run-crons.erb'),
  }

  cron::job { 'run-crons':
    command => script::path('run-crons'),
    minute  => '*/10',
  }

  $run::periods.each |$period, $seconds| {
    file { "/etc/cron.${period}":
      ensure => directory,
    }

    file { "${persistent_directory}/${period}.seconds":
      ensure  => file,
      content => "${seconds}\n",
    }
  }

  # Dirty hack to prevent cronie anacron support from breaking things.
  file { '/etc/cron.d/0hourly':
    ensure => absent
  }
  file { '/etc/cron.hourly/0anacron':
    ensure => absent
  }
}
