# @summary
#   Configures the Icinga 2 feature graphite.
#
# @param host
#   Graphite Carbon host address.
#
# @param port
#   Graphite Carbon port.
#
# @param enable_send_thresholds
#   Send additional threshold metrics.
#
# @param enable_send_metadata
#   Send additional metadata metrics.
#
class install::feature::graphite(
  Stdlib::Host                   $host                   = 'localhost',
  Stdlib::Port::Unprivileged     $port                   = 2003,
  Boolean                        $enable_send_thresholds = false,
  Boolean                        $enable_send_metadata   = false,
) {

  class { 'icinga2::feature::graphite':
    host                   => $host,
    port                   => $port,
    enable_send_thresholds => $enable_send_thresholds,
    enable_send_metadata   => $enable_send_metadata,
  }

}
