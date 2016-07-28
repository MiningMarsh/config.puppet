# Create a persistent file.
function persistent::filename (

  # The namespace to put this file under.
  String $namespace = undef,

  # The name of this file.
  String $name = undef,
) {

  $persistent_directory = persistent::directory($namespace)
  "${persistent_directory}/$name"
}

