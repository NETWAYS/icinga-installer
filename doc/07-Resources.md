# Resources

Resources for Icinga Web or the modules managed by the Icinga Installer are managed by the Installer itself. Since resources are to be entered exclusively in the file `/etc/icingaweb2/resources.ini`, additional resources added by hand, e.g. import sources for the director, would be deleted when the Installer runs again. 

Therefore, additionally required resources must also be managed via installer. For this purpose, these resources must be entered in `/etc/icinga-installer/custom-hiera.yaml`.

```yaml
icingaweb2::resources:
  'my-cmdb':
    type: pgsql
    host: localhost
    port: 5432
    database: cmdb
    username: cmdb
    password: supersecret
```

The parameters available for databases (types: mysql, pgsql, oracle, oci, mysql, ibm or sqlite) are explained in [icingaweb2::resource::database](https://github.com/Icinga/puppet-icingaweb2/blob/master/REFERENCE.md#icingaweb2resourcedatabase).

Authentication to an LDAP or Active Directory server also requires an additional resource (type: ldap), the list of allowed or required parameters can be found in [icingaweb2::resource::ldap](https://github.com/Icinga/puppet-icingaweb2/blob/master/REFERENCE.md#icingaweb2resourceldap).

```yaml
icingaweb2::resources:
  'ad-auth':
    type: ldap
    host: dc01.icinga.com
    port: 389
    encryption: starttls
    root_dn: dc=icinga,dc=com
    bind_dn: icingaweb2@icinga.com
    bind_pw: supersecret
```

NOTICE: When using encryption, either the RootCA certificate must be stored in the system and/or the system's LDAP client must be configured accordingly (e.g. dedicated specification of the RootCA or disabling of verification).
