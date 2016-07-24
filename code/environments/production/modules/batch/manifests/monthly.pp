define run::monthly (
  String $command = undef,
) {

  include run::period

  run::command { "run_command_${title}":
    command => $command,
    period  => $run::period::monthly,
  }
}
