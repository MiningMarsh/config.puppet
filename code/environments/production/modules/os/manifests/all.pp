class os::all {

  # Automatically update puppet on every machine.
  batch::entry { 'puppet':
    command => 'puppet apply /etc/puppetlabs/code/environments/production/site.pp',
    period  => daily
  }

  # Pretty issue file.
  include issue

  # Fstrim support.
  include fstrim
}
