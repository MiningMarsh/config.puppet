# Creates an atd batch entry, similair to cron::entry.
class batch::entry  (

  # What command to run.
  String $command = undef,

  # The period at which to run the command.
  String $period = undef,

  # Whether to re-batch this command if it has already been batched.
  Boolean $once = true,
) {

  require batch

  case $period {
    'hourly', 'daily', 'weekly', 'monthly': { $sanitized_period = $period }
  }

  if $once {
    require batch::persistence

    $batch_directory = "/etc/batch.${sanitized_period}.once"
    $batch_template = 'batch/command.batch.once.erb'
  } else {
    $cron_directory = "/etc/batch.${sanitized_period}"
    $cron_template = 'batch/command.batch.erb'
  }

  file { "${batch_directory}/puppet_${name}.batch":
    ensure  => file,
    content => template($cron_template),
    mode    => '0755',
    owner   => 'root',
  }
}
