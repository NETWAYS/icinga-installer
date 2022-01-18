# @summary
#   Configures the Icinga 2 feature elasticsearch.
#
# @param ensure
#   Set to present enables the feature elasticsearch, absent disables it.
#
# @param host
#    Elasticsearch host address.
#
# @param port
#    Elasticsearch HTTP port.
#
# @param index
#    Elasticsearch index name.
#
# @param username
#    Elasticsearch user name.
#
# @param password
#    Elasticsearch user password. The password parameter isn't parsed anymore.
#
# @param enable_send_perfdata
#   Whether to send check performance data metrics.
#
class install::feature::elasticsearch(
  Enum['absent', 'present']    $ensure               = present,
  Stdlib::Host                 $host                 = '127.0.0.1',
  Stdlib::Port::Unprivileged   $port                 = 9200,
  String                       $index                = 'icinga2',
  Optional[String]             $username             = undef,
  Optional[String]             $password             = undef,
  Boolean                      $enable_send_perfdata = false,
) {

  class { 'icinga2::feature::elasticsearch':
    host                 => $host,
    port                 => $port,
    index                => $index,
    username             => $username,
    password             => $password,
    enable_send_perfdata => $enable_send_perfdata,
  }

}
