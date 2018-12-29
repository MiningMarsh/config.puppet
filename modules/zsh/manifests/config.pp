class zsh::config {
	$path = zsh::stdlib()

	file { '/usr/local/lib/zsh':
		ensure => directory,
	}

	file { $path:
		content => file('zsh/std.lib'),
		ensure  => file,
	}
}
