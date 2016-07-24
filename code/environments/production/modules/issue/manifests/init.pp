class issue {
  file { '/etc/issue':
    content => file('issue/issue'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }
}
