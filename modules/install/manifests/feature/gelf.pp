# @summary
#   Configures the Icinga 2 feature gelf.
#
# @param [Stdlib::Host] host
#   GELF receiver host address.
#
# @param [Stdlib::Port::Unprivileged] port
#   GELF receiver port.
#
# @param [String] source
#   Source name for this instance.
#
# @param [Boolean] enable_send_perfdata
#   Enable performance data for 'CHECK RESULT' events.
#
class install::feature::gelf(
  Stdlib::Host                   $host                 = '127.0.0.1',
  Stdlib::Port::Unprivileged     $port                 = 12201,
  String                         $source               = 'icinga2',
  Boolean                        $enable_send_perfdata = false,
) {

  class { 'icinga2::feature::gelf':
    host                 => $host,
    port                 => $port,
    source               => $source,
    enable_send_perfdata => $enable_send_perfdata,
  }
}
