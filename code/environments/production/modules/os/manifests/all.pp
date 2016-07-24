class os::all {

  # Automatically update puppet on every machine.
  cron { 'puppet':
    command => 'puppet apply -v /etc/puppetlabs/code/environments/production/site.pp >> /var/log/puppet_apply.log 2>&1',
    user    => 'root',
    minute  => 30,
  }

  # Pretty issue file.
  include issue
}
