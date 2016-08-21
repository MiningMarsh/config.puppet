class zsh::config {
	$path = zsh::stdlib()

	file { $path:
		content => file('zsh/std.lib'),
		ensure  => file,
	}
}
