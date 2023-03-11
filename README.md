# Simple installer for the Icinga software stack

Setup an Icinga 2 with MySQL support for IDO, an Apache and Icinga Web 2 using PHP-FPM. For Icinga Web 2 also a MySQL Backend is installed by default. To switch to PostgreSQL use the interactive Mode (icinga-installer -i).

By default the Icinga and EPEL repository are included by the installer.

Requirements:
 * Puppet >= 6.1.0 < 8

The default Admin-Account for Icinga Web 2 is 'icingaadmin', the random initial password is displayed at the end of the installation process.

```bash
icinga-installer [-i] -S server-db-mysql|server-db-pgsql|server-ido-mysql|server-ido-pgsql|worker|agent
```

From the second run onwards, the -S option must be omitted because the host is now set to this scenario.


## Breaking Changes

With version 1.0.0 the IcingaDB has been added and has led to the fact that the individual modules had to be repartitioned. With this, a smooth update is unfortunately not possible. All answer files for servers (e.g. /etc/icinga-installer/scenarios.d/server-ido-mysql-answers.yaml) have changed and need to be recreated. Likewise the config files for servers (e.g. /etc/icinga-installer/scenarios.d/server-ido-mysql.yaml) must be taken from the now current version. The agent and worker config and answers files have remained unchanged. 


## Scenarios

### Servers

* server-db-mysql|server-db-pgsql: Install Server based on MySQL|PostgreSQL with IcingaDB as Backend.
* server-ido-mysql|server-ido-pgsql: same but with the deprecated IDO Backend instead of IcingaDB.

If your server should have connected workers, you've to configure those in `/etc/icinga-installer/custom-hiera.yaml`:

```
---
icinga::server::workers:
  dmz:
    endpoints:
      'worker.dmzdomain':
        host: 192.168.66.92
```

The example above describes a server with one worker zone `dmz` served by one Icinga instance `worker.dmzdomain` (192.168.66.92).

### Workers (aka Satellites)

The configuration of a connection on the server is described above. On the worker itself then do the following:

```
$ icinga-installer -S worker --ca-server 192.168.1.32 --zone dmz --parent-endpoints ubuntu22.icinga.installer:host:192.168.1.32 
```

The Server here is located on `192.168.1.32`. Alternatively, the required settings can of course also be made in interactive mode (`icinga-installer -S worker -i`).

### Agents

Configuring an agent is very similar to configuring a worker. But of course, the sceanario is different:

```
$ icinga-installer -S agent --ca-server 192.168.1.32 --parent-endpoints ubuntu22.icinga.installer:host:192.168.1.32 
```

Here the agent is connected directly to the server, a connection to a worker is also possible. But here additionally the name of the zone of the worker must be specified, because of course there can be no standard for this.

```
$ icinga-installer -S agent --ca-server 192.168.66.92 --parent-zone dmz --parent-endpoints ubuntu22.icinga.installer:host:192.168.66.92 
```

Alternatively, all settings can be made in interactive mode (`icinga-installer -S agent -i`).


## Setup

### on RHEL 7:

```bash
subscription-manager repos --enable rhel-7-server-optional-rpms
subscription-manager repos --enable rhel-server-rhscl-7-rpms

yum install -y https://packages.netways.de/extras/epel/7/noarch/netways-extras-release/netways-extras-release-7-1.el7.netways.noarch.rpm
yum install -y https://yum.puppet.com/puppet7/puppet7-release-el-7.noarch.rpm

yum install -y icinga-installer
```

### on CentOS 7:

```bash
yum install -y centos-release-scl

yum install -y https://packages.netways.de/extras/epel/7/noarch/netways-extras-release/netways-extras-release-7-1.el7.netways.noarch.rpm
yum install -y https://yum.puppet.com/puppet7-release-el-7.noarch.rpm

yum install -y icinga-installer
```

### on RHEL/AlmaLinux/Rocky 8 and CentOS Stream 8:

Icinga Web 2 >= v2.9 recommend PHP 7.3 or higher, so we have to change the default package module for PHP!

```bash
dnf install -y https://packages.netways.de/extras/epel/8/noarch/netways-extras-release/netways-extras-release-8-1.el8.netways.noarch.rpm
dnf install -y https://yum.puppet.com/puppet7-release-el-8.noarch.rpm

dnf module reset php
dnf module enable php:7.4

dnf install -y icinga-installer
```

**Notice**: For some time now, access to current RPM packages on Icinga has required a paid [subscription](https://icinga.com/subscription). Unfortunately, using older package versions for an Icinga server is not provided for in this project. However, for workers and agents, there should be no issues with the public repos and thus older versions of Icinga 2.

A subscription is required, it is configured as follows:

```bash
cat /etc/icinga-installer/custom-hiera.yaml
---
icinga::repos:
  icinga-stable-release:
    baseurl: 'https://packages.icinga.com/subscription/rhel/$releasever/release/'
    username: <username>
    password: <password>
```

Username `<user>` and password `<pass>` must be set according to your subscription.


### on RHEL/AlmaLinux/Rocky 9 and CentOS Stream 9:

```bash
dnf install -y https://packages.netways.de/extras/epel/9/noarch/netways-extras-release/netways-extras-release-9-1.el9.netways.noarch.rpm
dnf install -y https://yum.puppet.com/puppet7-release-el-9.noarch.rpm

dnf install -y icinga-installer
```

**Notice**: For some time now, access to current RPM packages on Icinga has required a paid [subscription](https://icinga.com/subscription). Unfortunately, using older package versions for an Icinga server is not provided for in this project. However, for workers and agents, there should be no issues with the public repos and thus older versions of Icinga 2.

A subscription is required, it is configured as follows:

```bash
cat /etc/icinga-installer/custom-hiera.yaml
---
icinga::repos:
  icinga-stable-release:
    baseurl: 'https://packages.icinga.com/subscription/rhel/$releasever/release/'
    username: <username>
    password: <password>
```

Username `<user>` and password `<pass>` must be set according to your subscription.


### on Debian Buster:

```
wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
echo "deb https://packages.netways.de/extras/debian buster main" | sudo tee /etc/apt/sources.list.d/netways-extras-release.list
wget -O -  https://apt.puppetlabs.com/DEB-GPG-KEY-puppet-20250406 | sudo apt-key add -
echo "deb http://apt.puppetlabs.com buster puppet7" | sudo tee /etc/apt/sources.list.d/puppet7.list
apt update

apt install -y icinga-installer
```

### on Debian Bullseye:

```
wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
echo "deb https://packages.netways.de/extras/debian bullseye main" | sudo tee /etc/apt/sources.list.d/netways-extras-release.list
wget -O -  https://apt.puppetlabs.com/DEB-GPG-KEY-puppet-20250406 | sudo apt-key add -
echo "deb http://apt.puppetlabs.com bullseye puppet7" | sudo tee /etc/apt/sources.list.d/puppet7.list
apt update

apt install -y icinga-installer
```

### on Ubuntu Focal Fossa:

```
apt install -y ca-certificates
wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
echo "deb https://packages.netways.de/extras/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/netways-extras-release.list
wget -O - https://apt.puppetlabs.com/DEB-GPG-KEY-puppet-20250406 | sudo apt-key add -
echo "deb http://apt.puppetlabs.com focal puppet7" | sudo tee /etc/apt/sources.list.d/puppet7.list
apt update

apt install -y icinga-installer
```

### on Ubuntu Jammy Jellyfish:

```
wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
echo "deb https://packages.netways.de/extras/ubuntu jammy main" | sudo tee /etc/apt/sources.list.d/netways-extras-release.list
wget -O - https://apt.puppetlabs.com/DEB-GPG-KEY-puppet-20250406 | sudo apt-key add -
echo "deb http://apt.puppetlabs.com jammy puppet7" | sudo tee /etc/apt/sources.list.d/puppet7.list
apt update

apt install -y icinga-installer
```
