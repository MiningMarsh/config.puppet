class os::all {

  # Automatically update puppet on every machine.
  run::entry { 'puppet':
    command => 'cd /etc/puppet; git pull; puppet apply --modulepath=/etc/puppet/modules /etc/puppet/site.pp',
    period  => daily
  }

  run::entry { 'puppet-stdlib':
    command => 'puppet module install puppetlabs-stdlib --target-dir /etc/puppet/modules',
    period  => daily
  }

  run::entry { 'puppet-modules':
    command => 'jq .dependencies -c < /etc/puppet/manifest.json | grep \'"[^"]*"\' -o | cut -f2 -d\'"\' | xargs -n1 puppet module install --target-dir /etc/puppet/modules',
    period  => daily
  }

  $features = [
    'defrag',
    'fstrim',
    'issue',
    'package',
    'zsh',
    'batch',
    'zfs',
    'irqbalance',
    'openrc',
    'arpd'
  ]

  $features.each |String $feature| {
    include $feature
  }
}
