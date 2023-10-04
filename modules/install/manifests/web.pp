# Class to manage Icinga Web 2.
#
# == Parameters:
#
# == Icinga Web parameters:
#
# $icingaweb::                                  Eanable/disable installation of Icinga Web.
#
# === IcingaWeb:                                condition: $icingaweb
#
# $initial_admin_username::                     Set initial admin username.
#
# $initial_admin_password::                     Set the inital password for the admin user.
#
# $db_type::                                    Set Icinga Web database type.
#
# $db_host::                                    Database host to connect.
#
# $db_port::                                    Database port to connect.
#
# $db_name::                                    Database to connect.
#
# $db_username::                                Account name to logon database.
#
# $db_password::                                Account password to logon database.
#
# $create_database::                            Enable initial creation of the database on this host.
#
# $api_host::                                   Icinga API endpoint to send commands.
#
# $api_password::                               Icinga API password.
#
# == IcingaDB parameters:
#
# $icingadb::                                   Enable the deprecated IDO based monitoring module.
#
# === IcingaDB:                                 condition: $icingadb
#
# $icingadb_db_type::                           Set IcingaDB backend database type.
#
# $icingadb_db_host::                           IcingaDB Database host to connect.
#
# $icingadb_db_port::                           IcingaDB database port to connect.
#
# $icingadb_db_name::                           IcingaDB database name.
#
# $icingadb_db_username::                       Account name to logon database.
#
# $icingadb_db_password::                       Account password to logon database.
#
# $redis_host::                                 Redis host to connect.
#
# $redis_port::                                 Redis port to connect.
#
# $redis_password::                             Password for Redis connection.
#
# == Monitoring (IDO) parameters:
#
# $ido::                                        Enable the deprecated IDO based monitoring module.
#
# === IDO:                                      condition: $ido
#
# $ido_db_type::                                Set IDO backend database type.
#
# $ido_db_host::                                IDO database host to connect.
#
# $ido_db_port::                                IDO database port to connect.
#
# $ido_db_name::                                Name of the IDO database to connect.
#
# $ido_db_username::                            Account name to logon database.
#
# $ido_db_password::                            Account password to logon database.
#
# $ido_create_database::                        Enable initial creation of the database on this host.
#
# == Director parameters:
#
# $director::                                   Enable the Director module.
#
# === Director:                                 condition: $director
#
# $director_db_type::                           Type of your database. Either `mysql` or `pgsql`.
#
# $director_db_host::                           Hostname of the database.
#
# $director_db_port::                           Port of the database.
#
# $director_db_name::                           Name of the database.
#
# $director_db_username::                       Username for DB connection.
#
# $director_db_password::                       Password for DB connection.
#
# $director_endpoint::                          Endpoint object name of Icinga 2 API.
#
# $director_create_database::                   Create database and import schema.
#
# $director_api_host::                          Icinga 2 API hostname.
#
# $director_api_password::                      Icinga 2 API password.
#
# == Business Process parameters:
#
# $business_process::                           Enable the Business Process module.
#
# == Reporting parameters:
#
# $reporting::                                  Enable the Reporting module.
#
# === Reporting:                                condition: $reporting
#
# $reporting_db_type::                          Type of your database. Either `mysql` or `pgsql`.
#
# $reporting_db_host::                          Hostname of the database.
#
# $reporting_db_port::                          Port of the database.
#
# $reporting_db_name::                          Name of the database.
#
# $reporting_db_username::                      Username for DB connection.
#
# $reporting_db_password::                      Password for DB connection.
#
# $reporting_create_database::                  Create database and import schema.
#
# $reporting_mail::                             Mails are sent with this sender address.
#
class install::web (
  Boolean                  $icingaweb                 = false,
  String                   $initial_admin_username    = 'icingaadmin',
  String                   $initial_admin_password    = $install::params::initial_admin_password,
  Enum['mysql', 'pgsql']   $db_type                   = 'mysql',
  Stdlib::Host             $db_host                   = 'localhost',
  Optional[Stdlib::Port]   $db_port                   = undef,
  String                   $db_name                   = 'icingaweb2',
  String                   $db_username               = 'icingaweb2',
  String                   $db_password               = $install::params::web_db_password,
  Boolean                  $create_database           = false,  
  Stdlib::Host             $api_host                  = 'localhost',
  String                   $api_password              = $install::params::web_api_password,
  Boolean                  $icingadb                  = false,
  Enum['mysql', 'pgsql']   $icingadb_db_type          = 'mysql',
  Stdlib::Host             $icingadb_db_host          = 'localhost',
  Optional[Stdlib::Port]   $icingadb_db_port          = undef,
  String                   $icingadb_db_name          = 'icingadb',
  String                   $icingadb_db_username      = 'icingadb',
  String                   $icingadb_db_password      = $install::params::icingadb_db_password,
  Stdlib::Host             $redis_host                = 'localhost',
  Optional[Stdlib::Port]   $redis_port                = undef,
  Optional['String']       $redis_password            = undef,
  Boolean                  $ido                       = false,
  Enum['mysql', 'pgsql']   $ido_db_type               = 'mysql',
  Stdlib::Host             $ido_db_host               = 'localhost',
  Optional[Stdlib::Port]   $ido_db_port               = undef,
  String                   $ido_db_name               = 'icinga2',
  String                   $ido_db_username           = 'icinga2',
  String                   $ido_db_password           = $install::params::ido_db_password,
  Boolean                  $ido_create_database       = false,
  Boolean                  $director                  = false,
  Enum['mysql', 'pgsql']   $director_db_type          = 'mysql',
  Stdlib::Host             $director_db_host          = 'localhost',
  Optional[Stdlib::Port]   $director_db_port          = undef,
  String                   $director_db_name          = 'director',
  String                   $director_db_username      = 'director',
  String                   $director_db_password      = $install::params::director_db_password,
  Boolean                  $director_create_database  = false,
  String                   $director_endpoint         = $install::params::director_endpoint,
  Stdlib::Host             $director_api_host         = 'localhost',
  String                   $director_api_password     = $install::params::director_api_password,
  Boolean                  $business_process          = false,
  Boolean                  $reporting                 = false,
  Enum['mysql', 'pgsql']   $reporting_db_type         = 'mysql',
  Stdlib::Host             $reporting_db_host         = 'localhost',
  Optional[Stdlib::Port]   $reporting_db_port         = undef,
  String                   $reporting_db_name         = 'reporting',
  String                   $reporting_db_username     = 'reporting',
  String                   $reporting_db_password     = $install::params::reporting_db_password,
  Boolean                  $reporting_create_database = false,
  Optional[String]         $reporting_mail            = undef,
) inherits install::params {
  if $ido and defined(Class['install::server']) {
    class { 'icinga::ido':
      db_type         => $ido_db_type,
      db_host         => $ido_db_host,
      db_port         => $ido_db_port,
      db_name         => $ido_db_name,
      db_user         => $ido_db_username,
      db_pass         => $ido_db_password,
      manage_database => $ido_create_database,  
    }
  }

  if $icingaweb {
    class { 'icinga::web':
      db_type            => $db_type,
      db_host            => $db_host,
      db_port            => $db_port,
      db_name            => $db_name,
      db_user            => $db_username,
      db_pass            => $db_password,
      default_admin_user => $initial_admin_username,
      default_admin_pass => $initial_admin_password,
      manage_database    => $create_database,
      api_host           => $api_host,
      api_pass           => $api_password,
    }

    if $icingadb {
      if defined(Class['install::icingadb']) {
        class { 'icinga::web::icingadb':
          db_type    => $install::icingadb::db_type,
          db_host    => $install::icingadb::db_host,
          db_port    => $install::icingadb::db_port,
          db_name    => $install::icingadb::db_name,
          db_user    => $install::icingadb::db_username,
          db_pass    => $install::icingadb::db_password,
          redis_host => $install::icingadb::redis_host,
          redis_port => $install::icingadb::redis_port,
          redis_pass => $install::icingadb::redis_password,
        }
      } else {
        class { 'icinga::web::icingadb':
          db_type    => $icingadb_db_type,
          db_host    => $icingadb_db_host,
          db_port    => $icingadb_db_port,
          db_name    => $icingadb_db_name,
          db_user    => $icingadb_db_username,
          db_pass    => $icingadb_db_password,
          redis_host => $redis_host,
          redis_port => $redis_port,
          redis_pass => $redis_password,
        }
      }
    } else {
      file { "${icingaweb2::globals::conf_dir}/enabledModules/icingadb":
        ensure => absent,
      }
    }

    if $ido {
      class { 'icinga::web::monitoring':
        db_type => $ido_db_type,
        db_host => $ido_db_host,
        db_port => $ido_db_port,
        db_name => $ido_db_name,
        db_user => $ido_db_username,
        db_pass => $ido_db_password,
      }
    } else {
      file { "${icingaweb2::globals::conf_dir}/enabledModules/monitoring":
        ensure => absent,
      }
    }

    file { '/usr/local/share/icingaweb2-modules':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }

    include apache::vhosts

    # Update on RHEL systems
    # https://github.com/NETWAYS/icinga-installer/issues/24
    if $facts['os']['family'] == 'redhat' {
      $new_file_content = "# content removed by icinga-installer\n# https://github.com/NETWAYS/icinga-installer/issues/24\n"

      file { prefix([
        '/00-base.conf',
        '/00-dav.conf',
        '/00-lua.conf',
        '/00-mpm.conf',
        '/00-optional.conf',
        '/00-proxy.conf',
        '/00-ssl.conf',
        '/00-systemd.conf',
        '/01-cgi.conf',
        '/10-h2.conf',
        '/10-proxy_h2.conf',
        '/15-php.conf'], $::apache::mod_dir) + prefix([
        '/autoindex.conf',
        '/php.conf',
        '/ssl.conf',
        '/userdir.conf',
        '/wellcome.conf'], $::apache::confd_dir):
        ensure  => file,
        content => $new_file_content,
        notify => Class['apache::service'],
      }
  
      if Integer($facts['os']['release']['major']) < 8 {
        file { prefix(['/autoindex.conf', '/userdir.conf', '/welcome.conf'], $::apache::confd_dir):
          ensure  => file,
          content => $new_file_content,
          notify => Class['apache::service'],
        }
      }
    }

    if $director {
      class { 'icinga::web::director':
        db_type         => $director_db_type,
        db_host         => $director_db_host,
        db_user         => $director_db_username,
        db_pass         => $director_db_password,
        manage_database => $director_create_database,
        endpoint        => $director_endpoint,
        api_host        => $director_api_host,
        api_pass        => pick($icinga::server::director_api_pass, $director_api_password),
      }
    } else {
      file { "${icingaweb2::globals::conf_dir}/enabledModules/director":
        ensure => absent,
      }
      file { "${icingaweb2::globals::conf_dir}/enabledModules/fileshipper":
        ensure => absent,
      }
    }
  
    if $business_process {
      class { 'icingaweb2::module::businessprocess':
        install_method => 'package',
      }
    } else {
      file { "${icingaweb2::globals::conf_dir}/enabledModules/businessprocess":
        ensure => absent,
      }
    }

    if $reporting {
      class { 'icinga::web::reporting':
        db_type         => $reporting_db_type,
        db_host         => $reporting_db_host,
        db_port         => $reporting_db_port,
        db_name         => $reporting_db_name,
        db_user         => $reporting_db_username,
        db_pass         => $reporting_db_password,
        manage_database => $reporting_create_database,
        mail            => $reporting_mail,
      }
    } else {
      file { "${icingaweb2::globals::conf_dir}/enabledModules/reporting":
        ensure => absent,
      }
      file { "${icingaweb2::globals::conf_dir}/enabledModules/idoreports":
        ensure => absent,
      }
    }
  }
}
