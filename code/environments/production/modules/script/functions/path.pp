# Generate the filename for a script to install.
function script::path (

  # The name of the script to install.
  String $name = undef,

  # Whether this is a privileged script.
  Boolean $privileged = true,
) {

  require script

  if $privileged {
    $script = "${script::privileged_script_directory}/puppet-${name}"
  } else {
    $script = "${script::script_directory}/puppet-${name}"
  }

  $script
}
