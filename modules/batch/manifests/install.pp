class batch::install {
	$packages = [
		'at',
		'libcgroup',
	]

	$packages.each |String $package| {
		package { $package:
			ensure => installed,
		}
	}
}
