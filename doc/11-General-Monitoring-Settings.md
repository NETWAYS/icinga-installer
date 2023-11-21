# General monitoring settings

To set general configuration add entries into `custom-hiera.yaml` as described in the [documentation](https://icinga.com/docs/icinga-web/latest/modules/monitoring/doc/03-Configuration/).

```yaml
icingaweb2::settings:
  acknowledge_expire: true
  acknowledge_expire_time: PT2H
```
