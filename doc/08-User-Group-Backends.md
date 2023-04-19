# Access Backends

The user and group backends or their configuration files (`authentication.ini` and `groups.ini`) are also managed exclusively by the Installer. Extensions must also be added in `/etc/icinga-installer/custo-hiera.yaml`.

```yaml
icingaweb2::user_backends:
  'ad-auth':
    backend: msldap
    resource: ad-auth
    ldap_filter: '((memberof:1.2.840.113556.1.4.1941:=CN=icinga,OU=groups,DC=icinga,DC=com)(!(userAccountControl:1.2.840.113556.1.4.803:=2))'
    order: '00'
icingaweb2::group_backends:
  'ad-auth':
    backend: msldap 
    resource: ad-auth
    ldap_group_filter: memberof:1.2.840.113556.1.4.1941:=CN=icinga,OU=groups,DC=icinga,DC=com
    ldap_user_backend: ad-auth
    order: '00'
```
