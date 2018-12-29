class polkit {
  include polkit::install
  include polkit::config

  Class[polkit::install] ->
  Class[polkit::config]
}
