# Class to install Icinga agent
#
# Parameters:
#
# $ca_server::            The CA to send the certificate request to.
#
# $parent_zone::          Name of the parent Icinga zone.
#
# $parent_endpoints::     Configures these endpoints of the parent zone.
#
# $global_zones::         List of global zones to configure.
#
# $logging_type::         Switch the log target. Only `file` is supported on Windows.
#
# $logging_level::        Set the log level.
#
class install::agent (
  Stdlib::Host            $ca_server,
  Hash[String, Hash]      $parent_endpoints,
  String                  $parent_zone   = 'main',
  Array[String]           $global_zones  = ['linux-commands'],
  Enum['file', 'syslog']  $logging_type  = 'syslog',
  Enum[
    'debug', 'information',
    'notice', 'warning', 'critical'
  ]                        $logging_level      = 'critical',
) inherits install::params {
  class { 'icinga::agent':
    ca_server        => $ca_server,
    parent_zone      => $parent_zone,
    parent_endpoints => $parent_endpoints,
    global_zones     => $global_zones,
    logging_type     => $logging_type,
    logging_level    => $logging_level,
  }
}
