class os::all {

  # Automatically update puppet on every machine.
  batch::entry { 'puppet':
    command => 'puppet apply /etc/puppetlabs/code/environments/production/site.pp',
    period  => daily
  }

  $features = [
    'defrag',
    'fstrim',
    'issue',
    'package',
    'zsh',
    'cron',
    'batch',
  ]

  $features.each |String $feature| {
    include $feature
  }
}
