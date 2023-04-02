# PHP

As with the configuration adjustments on Apache, PHP should also only be adjusted using `/etc/icinga-installer/custom-hiera.yaml`. So settings can be made in `php.ini` as follows:

```yaml
php::settings:
  'Date/date.timezone': Europe/Berlin
  'PHP/memory_limit': 1024M
  'PHP/max_execution_time': 120
```
