# Defines a batch entry to be run at a specified period.
define batch::entry (

  # The command to run.
  String $command = undef,

  # Whether the command should be re-run if the previous command has not yet
  # finished running.
  Boolean $once = true,

  # How often to run this command.
  String $period = undef,

) {

  require batch

  $batch::periods.each |$valid_period, $seconds| {
    if $period == $valid_period {
      if $once {
        $batch_directory = "/etc/batch.${period}.once"
      } else {
        $batch_directory = "/etc/batch.${period}"
      }

      file { "${batch_directory}/puppet_${name}.batch":
        ensure  => file,
        content => template('batch/command.batch.erb'),
        mode    => '0755',
        owner   => 'root',
      }
    }
  }
}
