# Simple installer for Icinga based on Puppet modules

Setup an Icinga 2 with MySQL support for IDO, an Apache and Icinga Web 2 using PHP-FPM. For Icinga Web 2 also a MySQL Backend is installed by default. To switch to PostgreSQL use the interactive Mode (icinga-installer -i).

By default the Icinga and EPEL repository are included by the installer.

Requirements:
 * Puppet >= 5.5.10 < 7

The default Admin-Account for Icinga Web 2 is 'icingaadmin' and 'icinga' as password.

```bash
$ icinga-installer [-i] -S server-ido-mysql|server-ido-pgsql|worker|agent
```

From the second run onwards, the -S option must be omitted because the host is now set to this scenario.


## Scenarios

### Servers

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


## Setup

Example on CentOS 7:

```bash
$ yum install https://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm
$ yum install https://packages.netways.de/extras/epel/7/noarch/netways-extras-release/netways-extras-release-7-1.el7.netways.noarch.rpm
$ yum install centos-release-scl

$ yum install icinga-installer
```

Example on CentOS 8:

```bash
$ dnf install https://yum.puppet.com/puppet6/puppet6-release-el-8.noarch.rpm
$ dnf install https://packages.netways.de/extras/epel/8/noarch/netways-extras-release/netways-extras-release-8-1.el8.netways.noarch.rpm

$ dnf install icinga-installer
```

Example on Debian Stretch:

```
$ apt install apt-transport-https gnupg
$ wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
$ wget -O - https://apt.puppet.com/DEB-GPG-KEY-puppet | sudo apt-key add -
$ echo "deb https://packages.netways.de/extras/debian stretch main" | sudo tee /etc/apt/sources.list.d/netways-extras.list
$ echo "deb https://apt.puppet.com stretch puppet6" | sudo tee /etc/apt/sources.list.d/puppet6.list
$ apt update

$ apt install icinga-installer
```

Example on Debian Buster:

```
$ wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
$ wget -O - https://apt.puppet.com/DEB-GPG-KEY-puppet | sudo apt-key add -
$ echo "deb https://packages.netways.de/extras/debian buster main" | sudo tee /etc/apt/sources.list.d/netways-extras.list
$ echo "deb http://apt.puppetlabs.com buster puppet6" | sudo tee /etc/apt/sources.list.d/puppet6.list
$ apt update

$ apt install icinga-installer
```

Example on Debian Bullseye:

```
$ wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
$ wget -O - https://apt.puppet.com/DEB-GPG-KEY-puppet | sudo apt-key add -
$ echo "deb https://packages.netways.de/extras/debian bullseye main" | sudo tee /etc/apt/sources.list.d/netways-extras.list
$ echo "deb http://apt.puppetlabs.com bullseye puppet6" | sudo tee /etc/apt/sources.list.d/puppet6.list
$ apt update

$ apt install icinga-installer
```

Example on Ubuntu Bionic Beaver:

```
$ wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
$ wget -O - https://apt.puppet.com/DEB-GPG-KEY-puppet | sudo apt-key add -
$ echo "deb https://packages.netways.de/extras/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/netways-extras.list
$ echo "deb http://apt.puppetlabs.com bionic puppet6" | sudo tee /etc/apt/sources.list.d/puppet6.list
$ apt update

$apt install icinga-installer
```

Example on Ubuntu Focal Fossa:

```
$ wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
$ wget -O - https://apt.puppet.com/DEB-GPG-KEY-puppet | sudo apt-key add -
$ echo "deb https://packages.netways.de/extras/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/netways-extras.list
$ echo "deb http://apt.puppetlabs.com focal puppet6" | sudo tee /etc/apt/sources.list.d/puppet6.list
$ apt update

$apt install icinga-installer
```

