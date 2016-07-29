class batch::config {

  $persistent_directory = persistent::directory('batch')

  $run_and_remove_lock_name = 'puppet-batch-run-and-remove-lock'
  script::install { $run_and_remove_lock_name:
    content => file('batch/run-and-remove-lock'),
  }
  $run_and_remove_lock = script::path($run_and_remove_lock_name)

  $batch_name = 'batch'
  $batch = script::path($batch_name, false)

  script::install { $batch_name:
    content    => file('batch/batch'),
    privileged => false,
  }

  $batch_once_name = "${batch_name}-once"
  $batch_once = script::path($batch_once_name, false)

  script::install { $batch_once_name:
    content    => template('batch/batch.once.erb'),
    privileged => false,
  }

  script::install { 'puppet-run-batchs':
    content => template('batch/run-batchs.erb'),
  }

  cron { 'puppet-run-batchs':
    command => script::path('puppet-run-batchs'),
    minute  => '*/10',
  }

  $batch::periods.each |$period, $seconds| {
    file { "/etc/batch.${period}":
      ensure => directory,
    }

    file { "/etc/batch.${period}.once":
      ensure => directory,
    }

    file { persistent::filename('batch', "${period}.seconds"):
      ensure  => file,
      content => "${seconds}\n",
    }
  }

  file { '/etc/conf.d/atd':
    ensure  => file,
    content => file('batch/atd.conf'),
  }
}