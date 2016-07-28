class cron {

  $periods = {
    'hourly'  => 60 * 60,
    'daily'   => 60 * 60 * 24,
    'weekly'  => 60 * 60 * 24 * 7,
    'monthly' => 60 * 60 * 24 * 31,
  }

  include cron::install
  include cron::config
  include cron::service

  Class['cron::install'] ->
  Class['cron::config'] ~>
  Class['cron::service']
}
