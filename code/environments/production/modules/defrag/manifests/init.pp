class defrag {
  include defrag::install
  include defrag::config

  Class[defrag::install] ->
  Class[defrag::config]
}
