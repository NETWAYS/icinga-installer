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
class install::web (
  Boolean                  $icingaweb                = false,
  String                   $initial_admin_username   = 'icingaadmin',
  String                   $initial_admin_password   = $install::params::initial_admin_password,
  Enum['mysql', 'pgsql']   $db_type                  = 'mysql',
  Stdlib::Host             $db_host                  = 'localhost',
  Optional[Stdlib::Port]   $db_port                  = undef,
  String                   $db_name                  = 'icingaweb2',
  String                   $db_username              = 'icingaweb2',
  String                   $db_password              = $install::params::web_db_password,
  Boolean                  $create_database          = false,  
  Stdlib::Host             $api_host                 = 'localhost',
  String                   $api_password             = $install::params::web_api_password,
  Boolean                  $ido                      = false,
  Enum['mysql', 'pgsql']   $ido_db_type              = 'mysql',
  Stdlib::Host             $ido_db_host              = 'localhost',
  Optional[Stdlib::Port]   $ido_db_port              = undef,
  String                   $ido_db_name              = 'icinga2',
  String                   $ido_db_username          = 'icinga2',
  String                   $ido_db_password          = $install::params::ido_db_password,
  Boolean                  $ido_create_database      = false,
  Boolean                  $director                 = false,
  Enum['mysql', 'pgsql']   $director_db_type         = 'mysql',
  Stdlib::Host             $director_db_host         = 'localhost',
  Optional[Stdlib::Port]   $director_db_port         = undef,
  String                   $director_db_name         = 'director',
  String                   $director_db_username     = 'director',
  String                   $director_db_password     = $install::params::director_db_password,
  Boolean                  $director_create_database = false,
  String                   $director_endpoint        = $install::params::director_endpoint,
  Stdlib::Host             $director_api_host        = 'localhost',
  String                   $director_api_password    = $install::params::director_api_password,
  Boolean                  $business_process         = false,
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

    include ::apache::vhosts

    # Update on RHEL systems
    # https://github.com/NETWAYS/icinga-installer/issues/24
    if $facts['os']['family'] == 'redhat' {
      $new_file_content = "# content removed by icinga-installer\n# https://github.com/NETWAYS/icinga-installer/issues/24\n"

      file { prefix([
        "/00-base.conf",
        "/00-dav.conf",
        "/00-lua.conf",
        "/00-mpm.conf",
        "/00-optional.conf",
        "/00-proxy.conf",
        "/00-ssl.conf",
        "/00-systemd.conf",
        "/01-cgi.conf"], $::apache::mod_dir):
        ensure  => file,
        content => $new_file_content,
        notify => Class['apache::service'],
      }
  
      if Integer($facts['os']['release']['major']) < 8 {
        file { prefix(["/autoindex.conf", "/userdir.conf", "/welcome.conf"], $::apache::confd_dir):
          ensure  => file,
          content => $new_file_content,
          notify => Class['apache::service'],
        }
      }
    }

    if $director {
      class { '::icinga::web::director':
        db_type         => $director_db_type,
        db_host         => $director_db_host,
        db_user         => $director_db_username,
        db_pass         => $director_db_password,
        manage_database => $director_create_database,
        endpoint        => $director_endpoint,
        api_host        => $director_api_host,
        api_pass        => $icinga::server::director_api_pass,
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
  }
}
