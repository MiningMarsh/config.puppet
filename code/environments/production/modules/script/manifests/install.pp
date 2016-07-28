define script::install (

  # The script to install.
  String $file = "${title}",

  # The content file to install.
  String $content = undef,

  # Whether this is a privileged script.
  Boolean $privileged = true,
) {

  require script

  $script = script::path($file, $privileged)

  file { $script:
    content => $content,
    mode    => '0755',
    owner   => 'root',
  }
}
