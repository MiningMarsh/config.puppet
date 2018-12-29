class script::shells {
  require zsh

  $shells = ['bash']

  $shells.each |$shell| {
    package { $shell:
      ensure => installed,
    }
  }
}
