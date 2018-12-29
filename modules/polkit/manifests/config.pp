class package::config {
  include zsh
  $stdlib = zsh::stdlib()


  $scripts.each |String $script| {
    script::install { $script:
      content => template("package/${script}.erb")
    }
  }

  batch::entry { 'update-portage':
    command => $update_portage,
    period => daily,
  }

  file { 'polkit-plugdev':
  	 path  => '/etc/polkit-1/rules.d/10-mount.rules',
	 content => template('polkit/mount.erb'),
	 owner   => 'polkitd',
	 group   => 'root'
  }
}
