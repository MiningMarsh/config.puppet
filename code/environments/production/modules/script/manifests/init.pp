class script {
  $script_directory_prefix = '/usr/local'
  $script_directory = "${script_directory_prefix}/bin"
  $privileged_script_directory = "${script_directory_prefix}/sbin"

  file { $script_directory:
    ensure => directory,
  }

  file { $privileged_script_directory:
    ensure => directory,
  }
}
