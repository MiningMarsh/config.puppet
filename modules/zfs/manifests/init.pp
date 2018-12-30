class zfs {
  include zfs::install
  include zfs::config

  Class[zfs::install] ->
  Class[zfs::config]
}
