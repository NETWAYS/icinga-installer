# Manage Icinga 2 features
#
# == Parameters:
#
# == Graphite parameters:
#
# $graphite::                  Enable graphite feature?
#
# === Graphite:                condition: $graphite
#
# $graphite_host::             Destination host for graphite data.
#
# $graphite_port::             Graphite Carbon port.
#
# $graphite_send_thresholds::  Send additional threshold metrics.
#
# $graphite_send_metadata::    Send additional metadata metrics.
#
# == InfluxDB2 parameters:
#
# $influxdb2::                 Enable influxdb2 feature?
#
# === InfluxDB2:               condition: $influxdb2
#
# $influxdb2_host::            Destionation host for influxdb2 data.
#
# $influxdb2_port::            InfluxDB HTTP port.
#
# $influxdb2_bucket::          InfluxDB bucket name.
#
# $influxdb2_organization::    InfluxDB organization name.
#
# $influxdb2_auth_token::      InfluxDB authentication token.
#
# $influxdb2_send_thresholds:: Whether to send warn, crit, min & max tagged data.
#
# $influxdb2_send_metadata::   Whether to send check metadata e.g. states, execution time, latency etc.
#
# == Livestatus parameters:
#
# $livestatus::                Enable Livestatus feature?
#
# === Livestatus:              condition: $livestatus
#
# $livestatus_socket_type::    Specifies the socket type. Can be either 'tcp' or 'unix'.
#
# ==== Livestatus_TCP:         condition: $livestatus_socket_type == 'tcp'
#
# $livestatus_bind_host::      IP address to listen for connections.
#
# $livestatus_bind_port::      Port to listen for connections.
#
# ==== Livestatus_Socket:      condition: $livestatus_socket_type == 'unix'
#
# $livestatus_socket_path::    Specifies the path to the UNIX socket file.
#
# == Elasicsearch parameters:
#
# $elasticsearch::             Enable Elasticsearch feature?
#
# === Elasticsearch:           condition: $elasticsearch
#
# $elastic_host::              Elasticsearch host address.
#
# $elastic_port::              Elasticsearch HTTP port.
#
# $elastic_index::             Elasticsearch index name.
#
# $elastic_username::          Elasticsearch user name.
#
# $elastic_ password::         Elasticsearch user password. The password parameter isn't parsed anymore.
#
# $elastic_send_perfdata::     Whether to send check performance data metrics.
#
# == GELF parameters:
#
# $gelf::                      Enable GELF feature?
#
# === GELF:                    condition: $gelf
#
# $gelf_host::                 GELF receiver host address.
#
# $gelf_port::                 GELF receiver port.
#
# $gelf_source::               Source name for this instance.
#
# $gelf_send_perfdata::        Enable performance data for 'CHECK RESULT' events.
#
class install::features (
  Boolean                       $graphite                  = false,
  Stdlib::Host                  $graphite_host             = 'localhost',
  Stdlib::Port::Unprivileged    $graphite_port             = 2003,
  Boolean                       $graphite_send_thresholds  = false,
  Boolean                       $graphite_send_metadata    = false,
  Boolean                       $influxdb2                 = false,
  Stdlib::Host                  $influxdb2_host            = 'localhost',
  Stdlib::Port                  $influxdb2_port            = 8086,
  String                        $influxdb2_bucket          = 'icinga2',
  String                        $influxdb2_organization    = 'CHANGEME',
  String                        $influxdb2_auth_token      = 'CHANGEME',
  Boolean                       $influxdb2_send_thresholds = false,
  Boolean                       $influxdb2_send_metadata   = false,
  Boolean                       $livestatus                = false,
  Enum['tcp', 'unix']           $livestatus_socket_type    = unix,
  Stdlib::Host                  $livestatus_bind_host      = '127.0.0.1',
  Stdlib::Port::Unprivileged    $livestatus_bind_port      = 6558,
  Stdlib::Absolutepath          $livestatus_socket_path    = '/var/run/icinga2/cmd/livestatus',
  Boolean                       $elasticsearch             = false,
  Stdlib::Host                  $elastic_host              = 'localhost',
  Stdlib::Port::Unprivileged    $elastic_port              = 9200,
  String                        $elastic_index             = 'icinga2',
  Optional[String]              $elastic_username          = undef,
  Optional[String]              $elastic_password          = undef,
  Boolean                       $elastic_send_perfdata     = false,
  Boolean                       $gelf                      = false,
  Stdlib::Host                  $gelf_host                 = 'localhost',
  Stdlib::Port::Unprivileged    $gelf_port                 = 12201,
  String                        $gelf_source               = 'icinga2',
  Boolean                       $gelf_send_perfdata        = false,
) inherits install::params {
  #
  # Graphite
  #
  class { 'icinga2::feature::graphite':
    ensure                 => if $graphite { 'present' } else { 'absent' },
    host                   => $graphite_host,
    port                   => $graphite_port,
    enable_send_thresholds => $graphite_send_thresholds,
    enable_send_metadata   => $graphite_send_metadata,
  }

  #
  # InfluxDB2
  #
  class { 'icinga2::feature::influxdb2':
    ensure                 => if $influxdb2 { 'present' } else { 'absent' },
    host                   => $influxdb2_host,
    port                   => $influxdb2_port,
    bucket                 => $influxdb2_bucket,
    organization           => $influxdb2_organization,
    auth_token             => $influxdb2_auth_token,
    enable_send_thresholds => $influxdb2_send_thresholds,
    enable_send_metadata   => $influxdb2_send_metadata,
  }

  #
  # Livestatus
  #
  $_compat_log_path = lookup('icinga2::feature::livestatus::compat_log_path', undef, undef, "${icinga2::globals::log_dir}/compat")

  class { 'icinga2::feature::compatlog':
    ensure  => if $livestatus { 'present' } else { 'absent' },
    log_dir => $_compat_log_path,
  }

  if $socket_type == 'unix' {
    class { 'icinga2::feature::livestatus':
      ensure          => if $livestatus { 'present' } else { 'absent' },
      socket_type     => $livestatus_socket_type,
      socket_path     => $livestatus_socket_path,
      compat_log_path => $_compat_log_path,
    }
  } else {
    class { 'icinga2::feature::livestatus':
      ensure          => if $livestatus { 'present' } else { 'absent' },
      bind_host       => $livestatus_bind_host,
      bind_port       => $livestatus_bind_port,
      compat_log_path => $_compat_log_path,
    }
  }

  #
  # Elasticsearch
  #
  class { 'icinga2::feature::elasticsearch':
    ensure               => if $elasticsearch { 'present' } else { 'absent' },
    host                 => $elasic_host,
    port                 => $elasic_port,
    index                => $elasic_index,
    username             => $elasic_username,
    password             => $elasic_password,
    enable_send_perfdata => $elasic_send_perfdata,
  }

  #
  # GELF
  #
  class { 'icinga2::feature::gelf':
    ensure               => if $gelf { 'present' } else { 'absent' },
    host                 => $gelf_host,
    port                 => $gelf_port,
    source               => $gelf_source,
    enable_send_perfdata => $gelf_send_perfdata,
  }
}
