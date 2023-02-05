# Manage IcingaDB
#
# == Parameters:
#
# $icingadb::                   Enable the IcingaDB daemon. Otherwise, these parameters only apply to Icinga server and web.
#
# $db_type::                    Choose wether MySQL or PostgreSQL as database backend.
#
# $db_host::                    Database host to connect.        
#
# $db_port::                    Database port to connect.
#
# $db_name::                    IcingaDB database name.
#
# $db_username::                Account to connect to database.
#
# $db_password::                Account password to connect to database.
#
# $create_database::            Install and configure the database on this host.
#
# $db_accesses::                Host with access to the IicngaDB databse, e.g. host running Icinga Web.
#
# $redis_host::                 Redis host to connect.
#
# $redis_bind::                 When Redis runs on a differnt host than Icinga, setting the listining interfaces.
#
# $redis_port::                 Port for Redis listening.
#
# $redis_password::             Password to authenticate against Redis.
#
# $create_redis::               Install and configure the IcingaDB Redis service also on this host.
#
class install::icingadb (
  Boolean                       $icingadb        = true,
  Enum['mysql', 'pgsql']        $db_type         = 'mysql',
  Stdlib::Host                  $db_host         = 'localhost',
  Optional[Stdlib::Port]        $db_port         = undef,
  String                        $db_name         = 'icingadb',
  String                        $db_username     = 'icingadb',
  String                        $db_password     = $install::params::icingadb_db_password,
  Boolean                       $create_database = false,
  Array[Stdlib::Host]           $db_accesses     = [],
  Stdlib::Host                  $redis_host      = 'localhost',
  Optional[Array[Stdlib::Host]] $redis_bind      = undef,
  Optional[Stdlib::Port]        $redis_port      = undef,
  Optional[String]              $redis_password  = undef,
  Boolean                       $create_redis    = true,
) inherits install::params {
  if defined(Class['install::server']) {
    class { 'icinga2::feature::icingadb':
      host     => $redis_host,
      port     => $redis_port,
      password => $redis_pass,
    }
  }

  if $icingadb {
    class { 'icinga::db':
      db_type         => $db_type,
      db_host         => $db_host,
      db_port         => $db_port,
      db_name         => $db_name,
      db_user         => $db_username,
      db_pass         => $db_password,
      manage_database => $create_database,
      db_accesses     => $db_accesses,
      redis_host      => $redis_host,
      redis_bind      => $redis_bind,
      redis_port      => $redis_port,
      redis_pass      => $redis_password,
      manage_redis    => $create_redis,
      manage_feature  => false,
    }
  } else {
    service { 'icingadb':
      ensure => stopped,
      enable => false,
    }
  }
}
