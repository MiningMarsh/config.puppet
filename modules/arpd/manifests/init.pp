class arpd {
  include openrc

  openrc::daemon { arpd: 
    arguments => "-a 5 -k -b /var/lib/arpd/arpd.db"
  }
}
