class fstrim {
  include fstrim::install
  include fstrim::config

  Class['fstrim::install'] ->
  Class['fstrim::config']
}
