# Create a persistent file.
function persistent::directory (

  # The namespace to put this file under.
  String $namespace = undef,

  # The directory name.
  String $name = undef,
) {

  $persistent_directory = persistent::namespace($namespace)
  $named_directory = "${persistent_directory}/${name}"

  file { $named_directory:
    ensure => directory,
  }

  $named_directory
}
