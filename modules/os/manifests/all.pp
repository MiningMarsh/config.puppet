class os::all {

  # Automatically update puppet on every machine.
  # TODO: Factor this out into a template because frankly this is getting ridiculous.
  run::entry { 'puppet':
    command => 'cd /etc/puppet; git pull; puppet apply --modulepath=/etc/puppet/modules /etc/puppet/site.pp; puppet module install puppetlabs-stdlib --target-dir /etc/puppet/modules; jq .dependencies -c < /etc/puppet/manifest.json | grep \'"[^"]*"\' -o | cut -f2 -d\'"\' | xargs -n1 puppet module install --target-dir /etc/puppet/modules; if [[ -d /etc/puppetlabs ]]; then rm -rf /etc/puppetlabs; fi',
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
