class cron::config {

  file { '/etc/crontab':
    ensure => absent,
  }

  $persistent_directory = persistent::directory('cron')

  script::install { 'puppet-run-crons':
    content => template('cron/run-crons.erb'),
  }

  cron { 'puppet-run-crons':
    command => script::path('puppet-run-crons'),
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
