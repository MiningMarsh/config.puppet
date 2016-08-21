class cron::config {

  file { '/etc/crontab':
    ensure => absent,
  }

  $persistent_directory = persistent::directory('cron', 'cron')

  $run_and_remove_lock_name = 'cron-run-and-remove-lock'
  script::install { $run_and_remove_lock_name:
    content => file('cron/run-and-remove-lock'),
  }
  $run_and_remove_lock = script::path($run_and_remove_lock_name)

  script::install { 'run-crons':
    content => template('cron/run-crons.erb'),
  }

  cron { 'run-crons':
    command => script::path('run-crons'),
    minute  => '*/10',
  }

  $cron::periods.each |$period, $seconds| {
    file { "/etc/cron.${period}":
      ensure => directory,
    }

    file { "/etc/cron.${period}.once":
      ensure => directory,
    }

    file { persistent::filename('cron', "${period}.seconds"):
      ensure  => file,
      content => "${seconds}\n",
    }
  }
}
