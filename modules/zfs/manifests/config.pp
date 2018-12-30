class zfs::config {
  include zsh
  $stdlib = zsh::stdlib()

  $zfs_scrub_name = 'zfs-scrub'
  $zfs_scrub = script::path($zfs_scrub_name)

  $scripts = [
    $zfs_scrub_name,
  ]

  $scripts.each |String $script| {
    script::install { $script:
      content => template("zfs/${script}.erb")
    }
  }

  batch::entry { 'zfs-scrub':
    command => $zfs_scrub,
    period => monthly,
  }
}
