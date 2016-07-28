# Create a persistent file.
function persistent::directory (

  # The namespace to put this file under.
  String $namespace = undef,
) {

  include persistent

  $namespace_directory = "${persistent::lib}/${namespace}"

  unless defined(File[$namespace_directory]) {
    file { $namespace_directory:
      ensure => directory,
    }
  }

  $namespace_directory
}

