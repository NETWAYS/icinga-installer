# @summary
#   Class to manage IDO and Icinga Web 2.
#
# == Parameters:
#
# @param [Boolean] manage_backend
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
# @param [Boolean] manage_frontend
#   Eanable/disable installation of Icinga Web 2.
#
# @param [Enum['mysql', 'pgsql']] db_type 	condition: $manage_frontend
#   Set Icinga Web 2 database type.
#
# @param [Stdlib::Host] db_host			condition: $manage_frontend
#   Database host to connect.
#
# @param [Optional[Stdlib::Port]] db_port	condition: $manage_frontend
#   Database port to connect.
#
# @param [String] db_name			condition: $manage_frontend
#   Database to connect.
#
# @param [String] db_username			condition: $manage_frontend
#   Account name to logon database.
#
# @param [String] db_password			condition: $manage_frontend
#   Account password to logon database.
#
# @param [Boolean] create_database		condition: $manage_frontend
#   Enable/disable initial creation of the frontend database.
#
# @param [Stdlib::Host] api_host	  	condition: $manage_frontend
#   Icinga API endpoint to send commands.
#
# @param [String] api_password  		condition: $manage_frontend
#   Icinga API password for user icingaweb2.
#
# @param [Boolean] enable_director              condition: $manage_frontend
#   Enable/disable the Director module.
#
# @param [Enum['mysql', 'pgsql']] director_db_type      condition: $enable_director
#   Type of your database. Either `mysql` or `pgsql`.
#
# @param [Stdlib::Host] director_db_host                condition: $enable_director
#   Hostname of the database.
#
# @param [Optional[Stdlib::Port]] director_db_port      condition: $enable_director
#   Port of the database.
#
# @param [String] director_db_name                      condition: $enable_director
#   Name of the database.
#
# @param [String] director_db_username                  condition: $enable_director
#   Username for DB connection.
#
# @param [String] director_db_password                  condition: $enable_director
#   Password for DB connection.
#
# @param [String] director_endpoint                     condition: $enable_director
#   Endpoint object name of Icinga 2 API.
#
# @param [Boolean] create_director_database             condition: $enable_director
#   Create database and import schema.
#
# @param [Stdlib::Host] director_api_host               condition: $enable_director
#   Icinga 2 API hostname.
#
# @param [String] director_api_password                 condition: $enable_director
#   Icinga 2 API password.
#
# @param [Boolean] enable_business_process              condition: $manage_frontend
#   Eanable/disable installation of Icinga Web 2 module Business Process.
#
class install::web(
  Boolean                  $manage_backend           = false,
  Enum['mysql', 'pgsql']   $backend_db_type          = 'mysql',
  Stdlib::Host             $backend_db_host          = 'localhost',
  Optional[Stdlib::Port]   $backend_db_port          = undef,
  String                   $backend_db_name          = 'icinga2',
  String                   $backend_db_username      = 'icinga2',
  String                   $backend_db_password      = $install::params::backend_db_password,
  Boolean                  $create_backend_database  = false,  
  Boolean                  $manage_frontend          = false,
  Enum['mysql', 'pgsql']   $db_type                  = 'mysql',
  Stdlib::Host             $db_host                  = 'localhost',
  Optional[Stdlib::Port]   $db_port                  = undef,
  String                   $db_name                  = 'icingaweb2',
  String                   $db_username              = 'icingaweb2',
  String                   $db_password              = $install::params::web_db_password,
  Boolean                  $create_database          = false,  
  Stdlib::Host             $api_host                 = 'localhost',
  String                   $api_password             = $install::params::web_api_password,
  Boolean                  $enable_director          = false,
  Enum['mysql', 'pgsql']   $director_db_type         = 'mysql',
  Stdlib::Host             $director_db_host         = 'localhost',
  Optional[Stdlib::Port]   $director_db_port         = undef,
  String                   $director_db_name         = 'director',
  String                   $director_db_username     = 'director',
  String                   $director_db_password     = $install::params::director_db_password,
  Boolean                  $create_director_database = false,
  String                   $director_endpoint        = $install::params::director_endpoint,
  Stdlib::Host             $director_api_host        = 'localhost',
  String                   $director_api_password    = $install::params::director_api_password,
  Boolean                  $enable_business_process  = false,
) inherits install::params {

  if $manage_backend {
    class { 'icinga::ido':
      db_type         => $backend_db_type,
      db_host         => $backend_db_host,
      db_port         => $backend_db_port,
      db_user         => $backend_db_username,
      db_pass         => $backend_db_password,
      manage_database => $create_backend_database,  
    }
  }

  if $manage_frontend {
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

  if $enable_director {
    class { '::icinga::web::director':
      db_type         => $director_db_type,
      db_host         => $director_db_host,
      db_user         => $director_db_username,
      db_pass         => $director_db_password,
      manage_database => $create_director_database,
      endpoint        => $director_endpoint,
      api_host        => $director_api_host,
      api_pass        => $icinga::server::director_api_pass,
    }
  }

  if $enable_business_process {
    class { 'icingaweb2::module::businessprocess':
      install_method => 'package',
    }
  }

}
