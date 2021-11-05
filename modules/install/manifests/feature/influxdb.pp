# @summary
#   Configures the Icinga 2 feature influxdb.
#
# @param [Stdlib::Host] host
#    InfluxDB host address.
#
# @param [Stdlib::Port] port
#    InfluxDB HTTP port.
#
# @param [String] database
#    InfluxDB database name.
#
# @param [Optional[String]] username
#    InfluxDB user name.
#
# @param [Optional[String]] password
#    InfluxDB user password. The password parameter isn't parsed anymore.
#
# @param [Boolean] enable_send_thresholds
#    Whether to send warn, crit, min & max tagged data.
#
# @param [Boolean] enable_send_metadata
#    Whether to send check metadata e.g. states, execution time, latency etc.
#
class install::feature::influxdb(
  Stdlib::Host      $host                   = 'localhost',
  Stdlib::Port      $port                   = 8086,
  String            $database               = 'icinga2',
  Optional[String]  $username               = undef,
  Optional[String]  $password               = undef,
  Boolean           $enable_send_thresholds = false,
  Boolean           $enable_send_metadata   = false,
) {

  class { 'icinga2::feature::influxdb':
    host                   => $host,
    port                   => $port,
    database               => $database,
    username               => $username,
    password               => $password,
    enable_send_thresholds => $enable_send_thresholds,
    enable_send_metadata   => $enable_send_metadata,
  }

}
