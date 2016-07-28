class os::all {

  # Automatically update puppet on every machine.
  cron::entry { 'puppet':
    command => 'puppet apply /etc/puppetlabs/code/environments/production/site.pp',
    period  => daily
  }

  # Pretty issue file.
  include issue
}
