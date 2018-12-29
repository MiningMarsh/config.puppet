class package {
  include package::install
  include package::config

  Class[package::install] ->
  Class[package::config]
}
