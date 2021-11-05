# @summary
#   Class to manage IDO and Icinga Web 2.
#
# == Parameters:
#
# @param [Boolean] backend
#   Enable/disable feature IDO and Database
#
# @param [Enum['mysql', 'pgsql']] backend_db_type
#   Set IDO backend database type.
#
# @param [Stdlib::Host] backend_db_host
#   IDO database host to connect.
#
# @param [Optional[Stdlib::Port]] backend_db_port
#   IDO database port to connect.
#
# @param [String] backend_db_name
#   Name of the IDO database to connect.
#
# @param [String] backend_db_username
#   Account name to logon database.
#
# @param [String] backend_db_password
#   Account password to logon database.
#
# @param [Boolean] create_backend_database
#   Enable/disable initial creation of the database for the backend.
#
# @param [Boolean] frontend
#   Eanable/disable installation of Icinga Web 2.
#
# @param [Enum['mysql', 'pgsql']] db_type 	condition: $frontend
#   Set Icinga Web 2 database type.
#
# @param [Stdlib::Host] db_host			condition: $frontend
#   Database host to connect.
#
# @param [Optional[Stdlib::Port]] db_port	condition: $frontend
#   Database port to connect.
#
# @param [String] db_name			condition: $frontend
#   Database to connect.
#
# @param [String] db_username			condition: $frontend
#   Account name to logon database.
#
# @param [String] db_password			condition: $frontend
#   Account password to logon database.
#
# @param [Boolean] create_database		condition: $frontend
#   Enable/disable initial creation of the frontend database.
#
# @param [Stdlib::Host] api_host	  	condition: $frontend
#   Icinga API endpoint to send commands.
#
# @param [String] api_password  		condition: $frontend
#   Icinga API password for user icingaweb2.
#
# @param [Boolean] business_processes		condition: $frontend
#   Eanable/disable installation of Icinga Web 2 module Business Process.
#
class install::web(
  Boolean                  $backend                 = false,
  Enum['mysql', 'pgsql']   $backend_db_type         = 'mysql',
  Stdlib::Host             $backend_db_host         = 'localhost',
  Optional[Stdlib::Port]   $backend_db_port         = undef,
  String                   $backend_db_name         = 'icinga2',
  String                   $backend_db_username     = 'icinga2',
  String                   $backend_db_password     = $install::params::backend_db_password,
  Boolean                  $create_backend_database = false,  
  Boolean                  $frontend                = false,
  Enum['mysql', 'pgsql']   $db_type                 = 'mysql',
  Stdlib::Host             $db_host                 = 'localhost',
  Optional[Stdlib::Port]   $db_port                 = undef,
  String                   $db_name                 = 'icingaweb2',
  String                   $db_username             = 'icingaweb2',
  String                   $db_password             = $install::params::web_db_password,
  Boolean                  $create_database         = false,  
  Stdlib::Host             $api_host                = 'localhost',
  String                   $api_password            = $install::params::web_api_password,
  Boolean                  $business_processes      = false,
) inherits install::params {

  if $backend {
    class { 'icinga::ido':
      db_type         => $backend_db_type,
      db_host         => $backend_db_host,
      db_port         => $backend_db_port,
      db_user         => $backend_db_username,
      db_pass         => $backend_db_password,
      manage_database => $create_backend_database,  
    }
  }

  if $frontend {
    class { 'icinga::web':
      db_type          => $db_type,
      db_host          => $db_host,
      db_port          => $db_port,
      db_name          => $db_name,
      db_user          => $db_username,
      db_pass          => $db_password,
      manage_database  => $create_database,
      api_host         => $api_host,
      api_pass         => $api_password,
      backend_db_type  => $backend_db_type,
      backend_db_host  => $backend_db_host,
      backend_db_port  => $backend_db_port,
      backend_db_name  => $backend_db_name,
      backend_db_user  => $backend_db_username,
      backend_db_pass  => $backend_db_password,
    }
  }

  if $business_processes {
    class { 'icingaweb2::module::businessprocess':
      install_method => 'package',
    }
  }

}
