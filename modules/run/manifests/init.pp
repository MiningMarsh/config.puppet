class run {

  $periods = {
    'hourly'  => 60 * 60,
    'daily'   => 60 * 60 * 24,
    'weekly'  => 60 * 60 * 24 * 7,
    'monthly' => 60 * 60 * 24 * 31,
  }

  include run::install
  include run::config
  include run::service

  Class['run::install'] ->
  Class['run::config'] ~>
  Class['run::service']
}
