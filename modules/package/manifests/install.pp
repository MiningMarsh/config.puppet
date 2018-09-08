class package::install {
	include zsh
	$stdlib = zsh::stdlib()

	init::script { clean-batch:
		content => template('package/clean-batch.erb')
	}


	$packages = [
		'eix',
		'gentoolkit',
		'layman',
		'portage',
		'portage-utils',
		'smart-live-rebuild',
	]

	$packages.each |String $package| {
		package { $package:
			ensure => installed,
		}
	}
}
