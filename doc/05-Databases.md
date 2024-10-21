# Databases

## External database examples

The following parameters, except for TLS, can of course also be set via CLI or in interactive mode. That means the optional TLS parameters have to be stored in `/etc/icinga-installer/custom-hiera.yaml`!

### Icinga Web

```yaml
install::web::db_type: <psql|mysql>
install::web::db_password: *****
install::web::db_host: <ip addr remote database host>
install::web::create_database: false
```

Optional for TLS secured connections add:

```yaml
icingaweb2::use_tls: true
icingaweb2::tls_noverify: false
icingaweb2::tls_cacert_file: <location of cacert, if tls_noverify = false>
```

For more details, see class [icingaweb2](https://github.com/Icinga/puppet-icingaweb2/blob/master/REFERENCE.md#icingaweb2).

### IcingaDB

```yaml
install::icingadb::db_host: <ip addr remote database host>
install::icingadb::db_password: *****
install::icingadb::create_database: false
install::web::icingadb_db_type: "%{lookup('install::icingadb::db_type')}"
install::web::icingadb_db_host: "%{lookup('install::icingadb::db_host')}"
install::web::icingadb_db_username: <maybe different user with read only permissions>
install::web::icingadb_db_password: *****
```

Optional for TLS secured connections add:

```yaml
icingadb::db_use_tls: true
icingadb::db_tls_insecure: true
icingadb::db_tls_cacert_file: <location of cacert, if db_tls_insecure = true>
icingaweb2::module::icingadb::db_use_tls: true
icingaweb2::module::icingadb::db_tls_noverify: false
icingaweb2::module::icingadb::db_tls_cacert_file: <location of cacert, if db_tls_noverify = false>
```

For more details, see classes [icingadb](https://github.com/Icinga/puppet-icingadb/blob/main/REFERENCE.md#icingadb) and [icingaweb2::module::icingadb](https://github.com/Icinga/puppet-icingaweb2/blob/master/REFERENCE.md#icingaweb2moduleicingadb).

### IDO

```yaml
install::web::ido_db_type: <mysql|pgsql>
install::web::ido_db_host: <ip addr remote database host>
install::web::ido_db_password: *****
install::web::ido_create_database: false
```

### Director

```yaml
install::web::director_db_type: <mysql|pgsql>
install::web::director_db_host: <ip addr remote database host>
install::web::create_director_db_password: *****
install::web::create_director_database: false
```

Optional for TLS secured connections add:

```yaml
icingaweb2::module::director::use_tls: true
icingaweb2::module::director::tls_noverify: false
icingaweb2::module::director::tls_cacert_file: <location of cacert, if tls_noverify = false>
```

For more details, see class [icingaweb2::module::director](https://github.com/Icinga/puppet-icingaweb2/blob/master/REFERENCE.md#icingaweb2moduledirector).

### Reporting

```yaml
install::web::reporting_db_type: <mysql|pgsql>
install::web::reporting_db_host: <ip addr remote database host>
install::web::reporting_db_password: *****
install::web::reporting_create_database: false
```

Optional for TLS secured connections add:

```yaml
icingaweb2::module::reporting::use_tls: true
icingaweb2::module::reporting::tls_noverify: false
icingaweb2::module::reporting::tls_cacert_file: <location of cacert, if tls_noverify = false>
```

For more details, see class [icingaweb2::module::reporting](https://github.com/Icinga/puppet-icingaweb2/blob/master/REFERENCE.md#icingaweb2modulereporting).

## Database Management Systems

If the databases are running on the local host, the underlying DBMS can also be configured via `/etc/icinga-installer/custom-hiera.yaml`.

### MariaDB Example

For more details, see class [mysql::server](https://github.com/puppetlabs/puppetlabs-mysql/blob/main/REFERENCE.md#mysqlserver).

```yaml
mysql::server::root_password: supersecret
mysql::server::override_options:
  mysqld:
    bind-address: '0.0.0.0'
    innodb_buffer_pool_size: 16G
    innodb_flush_log_at_trx_commit: 0
```

### PostgreSQL Example

For more details, see class [postgresql::server](https://github.com/puppetlabs/puppetlabs-postgresql/blob/main/REFERENCE.md#postgresqlserver).

```yaml
postgresql::server::config_entries:
  listen_addresses: '*'
  max_connections: 120
```
