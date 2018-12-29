class zsh {
  include ramdisk
  include zsh::install
  include zsh::config

  Class[zsh::install] ->
  Class[zsh::config]
}
