# SELinux

SELinux is only enabled by default for the Worker and Agent scenarios on RedHat platforms. To disable the management of SELinux for workers or agents, the following must be set in custom-hiera.yaml:

```yaml
icinga2::manage_selinux: false
```

For Icinga servers the additinal Puppet modules icingaweb2 and icingadb don't support SELinux. To setup an Icinga server set SELinux to `disabled` or `permessive`.
