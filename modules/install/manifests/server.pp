# @summary
#   Setup a Icinga server.
#
# @param ca
#   Enables a CA on this node.
#
# @param zone
#   Name of the Icinga zone.
#
# @param global_zones
#   List of global zones to configure.
#
# @param ticket_salt
#   Set an alternate ticket salt to icinga::ticket_salt from Hiera.
#
# @param web_api_pass
#   Icinga API user password.
#
# @param director_api_pass
#   Icinga API director user password.
#
# @param logging_type
#   Switch the log target. Only `file` is supported on Windows.
#
# @param logging_level
#   Set the log level.
#
class install::server(
  Boolean                  $ca                 = true,
  String                   $zone               = 'main',
  Array[String]            $global_zones       = ['linux-commands', 'windows-commands', 'global-templates', 'director-global'],
  String                   $ticket_salt        = $install::params::ticket_salt,
  String                   $web_api_pass       = $install::params::web_api_password,
  String                   $director_api_pass  = $install::params::director_api_password,
  Enum['file', 'syslog']   $logging_type       = 'syslog',
  Enum[
    'debug', 'information',
    'notice', 'warning', 'critical'
  ]                        $logging_level      = 'critical',
) inherits install::params {

  class { 'icinga::server':
    ca                => $ca,
    config_server     => lookup('icinga::server::config_server', undef, undef, $ca),
    zone              => $zone,
    global_zones      => $global_zones,
    ticket_salt       => $ticket_salt,
    web_api_pass      => $web_api_password,
    director_api_pass => $director_api_password,
    logging_type      => $logging_type,
    logging_level     => $logging_level,
  }

}
