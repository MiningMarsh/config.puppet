define run::command (
  String $command = undef,
  String $period  = undef,
) { 

  include run

  file { "/etc/cron.${period}/puppet_${name}.cron":
    ensure  => file,
    content => template('run/command.cron.erb'),
    mode    => '0755',
    owner   => 'root',
  }
}
