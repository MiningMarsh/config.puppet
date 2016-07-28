# Defines a cron entry to be run at a specified period.
define cron::entry (

  # The command to run.
  String $command = undef,

  # Whether the command should be re-run if the previous command has not yet
  # finished running.
  Boolean $once = true,

  # How often to run this command.
  String $period = undef,

) {

  require cron

  $cron::periods.each |$valid_period, $seconds| {
    if $period == $valid_period {
      if $once {
        $cron_directory = "/etc/cron.${period}.once"
      } else {
        $cron_directory = "/etc/cron.${period}"
      }

      file { "${cron_directory}/puppet_${name}.cron":
        ensure  => file,
        content => template('cron/command.cron.erb'),
        mode    => '0755',
        owner   => 'root',
      }
    }
  }
}
