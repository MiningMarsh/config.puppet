class fstrim::config {
  batch::entry { 'fstrim':
    command => 'fstrim -a',
    period  => hourly,
  }
}
