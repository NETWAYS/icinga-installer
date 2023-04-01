# Simple installer for the Icinga software stack



Requirements:
 * Puppet >= 6.1.0 < 8

The default Admin-Account for Icinga Web 2 is 'icingaadmin', the random initial password is displayed at the end of the installation process.

```bash
icinga-installer [-i] -S server-db-mysql|server-db-pgsql|server-ido-mysql|server-ido-pgsql|worker|agent
```

From the second run onwards, the -S option must be omitted because the host is now set to this scenario.


## Breaking Changes

With version 1.0.0 the IcingaDB has been added and has led to the fact that the individual modules had to be repartitioned. With this, a smooth update is unfortunately not possible. All answer files for servers (e.g. /etc/icinga-installer/scenarios.d/server-ido-mysql-answers.yaml) have changed and need to be recreated. Likewise the config files for servers (e.g. /etc/icinga-installer/scenarios.d/server-ido-mysql.yaml) must be taken from the now current version. The agent and worker config and answers files have remained unchanged. 
