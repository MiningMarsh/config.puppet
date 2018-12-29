class ramdisk {
  include zsh
  $stdlib = zsh::stdlib()

  init::script { ramdisk:
    content => template('ramdisk/ram.erb')
  }
}
