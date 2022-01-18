# @summary
#   Configures the Icinga 2 feature influxdb.
#
# @param host
#    InfluxDB host address.
#
# @param port
#    InfluxDB HTTP port.
#
# @param database
#    InfluxDB database name.
#
# @param username
#    InfluxDB user name.
#
# @param password
#    InfluxDB user password. The password parameter isn't parsed anymore.
#
# @param enable_send_thresholds
#    Whether to send warn, crit, min & max tagged data.
#
# @param enable_send_metadata
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
