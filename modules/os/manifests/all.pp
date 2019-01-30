class os::all {

  # Automatically update puppet on every machine.
  batch::entry { 'puppet':
    command => 'cd /etc/puppet; git pull; puppet apply --modulepath=/etc/puppet/modules /etc/puppet/site.pp',
    period  => daily
  }

  batch::entry { 'puppet-stdlib':
    command => 'puppet module install puppetlabs-stdlib --target-dir /etc/puppet/modules',
    period  => daily
  }

  batch::entry { 'puppet-modules':
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
  ]

  $features.each |String $feature| {
    include $feature
  }
}
