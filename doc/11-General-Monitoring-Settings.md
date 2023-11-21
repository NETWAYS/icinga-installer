# General monitoring settings

To set general configuration add entries into `custom-hiera.yaml` as described in the [documentation](https://icinga.com/docs/icinga-web/latest/modules/monitoring/doc/03-Configuration/).

For the deprecated IDO monitoring module:

```yaml
icingaweb2::module::monitoring::settings:
  acknowledge_expire: true
  acknowledge_expire_time: PT2H
```

Or for the new IcingaDB module:

```yaml
icingaweb2::module::icingadb::settings:
  acknowledge_expire: true
  acknowledge_expire_time: PT2H
```
