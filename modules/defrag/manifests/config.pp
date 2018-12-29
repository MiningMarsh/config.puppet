class defrag::config {
  $defrag_if_needed_name = 'defrag-if-needed'
  $defrag_all_if_needed_name = 'defrag-all-if-needed'

  $defrag_if_needed = script::path($defrag_if_needed_name)
  script::install { $defrag_if_needed_name:
    content => file('defrag/defrag-if-needed'),
  }

  script::install { $defrag_all_if_needed_name:
    content => template('defrag/defrag-all-if-needed.erb'),
  }

  batch::entry { 'defrag_all_if_needed':
    command => script::path($defrag_all_if_needed_name),
    period  => monthly,
  }
}
