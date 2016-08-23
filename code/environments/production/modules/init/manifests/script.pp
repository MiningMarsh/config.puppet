define init::script (
  String $content = undef,
) {
  include zsh

  $prefix = '/etc/local.d'

  $script_name = "init-script-${title}"
  $script = script::path($script_name)
  script::install { $script_name:
    content => $content
  }

  file { "${prefix}/puppet_${title}.start":
    content => template('init/script.start'),
    mode => '0755',
    ensure => file,
  }

  file { "${prefix}/puppet_${title}.stop":
    content => template('init/script.stop'),
    mode => '0755',
    ensure => file,
  }
}
