class script::shells {
  $shells = ['zsh', 'bash']

  $shells.each |$shell| {
    package { $shell:
      ensure => installed,
    }
  }
}
