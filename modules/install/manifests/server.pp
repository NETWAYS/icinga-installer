# @summary
#   Setup a Icinga server.
#
# @param [Boolean] ca
#   Enables a CA on this node.
#
# @param [String] zone
#   Name of the Icinga zone.
#
# @param [Array[String]] global_zones
#   List of global zones to configure.
#
# @param [Optional[String]] ticket_salt
#   Set an alternate ticket salt to icinga::ticket_salt from Hiera.
#
# @param [Optional[String]] web_api_pass
#   Icinga API user password.
#
# @param [Enum['file', 'syslog']] logging_type
#   Switch the log target. Only `file` is supported on Windows.
#
# @param [Icinga2::LogSeverity] logging_level
#   Set the log level.
#
class install::server(
  Boolean                  $ca            = true,
  String                   $zone          = 'main',
  Array[String]            $global_zones  = [],
  String                   $ticket_salt   = $install::params::ticket_salt,
  String                   $web_api_pass  = $install::params::web_api_password,
  Enum['file', 'syslog']   $logging_type  = 'syslog',
  Icinga2::LogSeverity     $logging_level = 'critical',
) inherits install::params {

  class { 'icinga::server':
    ca            => $ca,
    config_server => $ca,
    zone          => $zone,
    global_zones  => $global_zones,
    ticket_salt   => $ticket_salt,
    web_api_pass  => $web_api_password,
    logging_type  => $logging_type,
    logging_level => $logging_level,
  }

}
