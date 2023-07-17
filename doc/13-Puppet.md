# Puppet Agent

By default the puppet agent is disable by the installer. To prevent this, because maybe the host is managed by puppet after all, enter the following in `/etc/icinga-installer/custom-hiera.yaml`.

```yaml
puppet::disable: false
```
