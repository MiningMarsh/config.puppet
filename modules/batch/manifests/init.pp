class batch {

  $periods = {
    'frequently' => 15 * 60,
    'hourly'   => 60 * 60,
    'daily'    => 60 * 60 * 24,
    'weekly'   => 60 * 60 * 24 * 7,
    'monthly'  => 60 * 60 * 24 * 31,
  }

  include batch::install
  include batch::config
  include batch::service

  Class['batch::install'] ->
  Class['batch::config'] ~>
  Class['batch::service']
}
