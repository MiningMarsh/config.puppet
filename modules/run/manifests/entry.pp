# Defines a cron entry to be run at a specified period.
define run::entry (

  # The command to run.
  String $command = undef,

  # Whether the command should be re-run if the previous command has not yet
  # finished running.
  Boolean $once = true,

  # How often to run this command.
  String $period = undef,

) {

  require run 

  $run::periods.each |$valid_period, $seconds| {
    if $period == $valid_period {
        $run_directory = "/etc/cron.${period}"

      file { "${run_directory}/puppet_${name}.cron":
        ensure  => file,
        content => template('run/command.cron.erb'),
        mode    => '0755',
        owner   => 'root',
      }
    }
  }
}
