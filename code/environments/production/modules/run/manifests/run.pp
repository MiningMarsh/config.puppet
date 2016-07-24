class run {
	include run::install
	include run::config
	include run::service

	Package["${run::install::package}"] ->
	File["${run::config::file}"] ~>
	Service["${run::service::service}"]
}
