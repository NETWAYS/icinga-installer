# @summary
#   Configures the Icinga 2 feature livestatus.
#
# @param socket_type
#   Specifies the socket type. Can be either 'tcp' or 'unix'.
#
# @param bind_host		condition: $socket_type == 'tcp'
#   IP address to listen for connections. Only valid when socket_type is 'tcp'.
#
# @param bind_port		condition: $socket_type == 'tcp'
#   Port to listen for connections. Only valid when socket_type is 'tcp'.
#
# @param socket_path		condition: $socket_type == 'unix'
#   Specifies the path to the UNIX socket file. Only valid when socket_type is 'unix'.
#
class install::feature::livestatus(
  Enum['tcp', 'unix']          $socket_type     = unix,
  Stdlib::Host                 $bind_host       = '127.0.0.1',
  Stdlib::Port::Unprivileged   $bind_port       = 6558,
  Stdlib::Absolutepath         $socket_path     = '/var/run/icinga2/cmd/livestatus',
) {

  $_compat_log_path = lookup('icinga2::feature::livestatus::compat_log_path', undef, undef, "${icinga2::globals::log_dir}/compat")

  class { 'icinga2::feature::compatlog':
    log_dir => $_compat_log_path,
  }

  if $socket_type == 'unix' {
    class { 'icinga2::feature::livestatus':
      socket_type     => $socket_type,
      socket_path     => $socket_path,
      compat_log_path => $_compat_log_path,
    }
  } else {
    class { 'icinga2::feature::livestatus':
      bind_host       => $bind_host,
      bind_port       => $bind_port,
      compat_log_path => $_compat_log_path,
    }
  }

}
