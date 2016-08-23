class package::config {
  include zsh
  $stdlib = zsh::stdlib()

  $update_portage_name = 'portage-update'
  $update_portage = script::path($update_portage_name)
  $update_portage_timestamp = persistent::filename('package', 'portage-update-timestamp')

  $update_use_name = 'portage-update-use'
  $update_use = script::path($update_use_name)

  $update_keywords_name = 'portage-update-keywords'
  $update_keywords = script::path($update_keywords_name)

  $update_accept_keywords_name = 'portage-update-accept-keywords'
  $update_accept_keywords = script::path($update_accept_keywords_name)

  $directories = [
    '/etc/portage/package.use',
    '/etc/portage/package.keywords',
  ]

  $directories.each |String $directory| {
    file { $directory:
      ensure => directory,
    } ->

    file { "${directory}/puppet":
      ensure => directory,
    } ->

    file { "${directory}/local":
      ensure => directory,
    }
  }

  file { '/etc/portage/package.accept_keywords':
    ensure => directory,
  } ->

  file { '/etc/portage/package.accept_keywords/puppet':
    ensure => directory,
  } ->

  file { '/etc/portage/package.accept_keywords/cvs':
    ensure => directory,
  } ->

  file { '/etc/portage/package.accept_keywords/unstable':
    ensure => directory,
  }

  $scripts = [
    $update_portage_name,
    $update_use_name,
    $update_keywords_name,
    "${update_accept_keywords_name}-cvs",
    "${update_accept_keywords_name}-unstable",
  ]

  $scripts.each |String $script| {
    script::install { $script:
      content => template("package/${script}.erb")
    }
  }

  batch::entry { 'update-portage':
    command => $update_portage,
    period => daily,
  }
}
