# Simple installer for the Icinga software stack

The `icinga-installer` installer is a tool to install and manage you Icinga instance. It is based on Puppet and uses `YAML` configuration.

## Requirements:

 * Puppet >= 6.24.0 < 8
 * Rubygem `kafo`

## Installation

Please refer to the [doc](https://github.com/NETWAYS/icinga-installer/tree/main/doc) directory for an installation guide and further information how to configure the Installer.

## Usage

The default Admin-Account for Icinga Web 2 is 'icingaadmin', the random initial password is displayed at the end of the installation process.

```bash
icinga-installer [-i] -S server-db-mysql|server-db-pgsql|server-ido-mysql|server-ido-pgsql|worker|agent
```

From the second run on, the -S option may be omitted, since the host is now set to this scenario.

# Upgrade Guide

## Upgrading to 1.0.0

### Breaking Changes

With version 1.0.0 the IcingaDB has been added and has led to the fact that the individual modules had to be repartitioned. With this, a smooth update is unfortunately not possible. All answer files for servers (e.g. /etc/icinga-installer/scenarios.d/server-ido-mysql-answers.yaml) have changed and need to be recreated. Likewise the config files for servers (e.g. /etc/icinga-installer/scenarios.d/server-ido-mysql.yaml) must be taken from the now current version. The agent and worker config and answers files have remained unchanged.
