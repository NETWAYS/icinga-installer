# Puppet modules for managing Icinga

Example on CentOS 7:

```bash
$ dnf install https://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm
$ dnf install https://packages.netways.de/extras/epel/7/noarch/netways-extras-release/netways-extras-release-7-1.el7.netways.noarch.rpm

$ dnf install icinga-installer puppet-agent
$ icinga-installer [-i] -S standalone
```

Example on CentOS 8:

```bash
$ dnf install https://yum.puppet.com/puppet6/puppet6-release-el-8.noarch.rpm
$ dnf install https://packages.netways.de/extras/epel/8/noarch/netways-extras-release/netways-extras-release-8-1.el8.netways.noarch.rpm

$ dnf install icinga-installer puppet-agent
$ icinga-installer [-i] -S standalone
```

Example on Debian Stretch:

```
$ apt install apt-transport-https
$ wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
$ wget -O - https://apt.puppet.com/DEB-GPG-KEY-puppet | sudo apt-key add -
$ echo "deb https://packages.netways.de/extras/debian stretch main" | sudo tee /etc/apt/sources.list.d/netways-extras.list
$ echo "https://apt.puppet.com/puppet6-release-stretch.deb" | sudo tee /etc/apt/sources.list.d/puppet6.list
$ apt update

```

Example on Debian Buster:

```
$ wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
$ wget -O - https://apt.puppet.com/DEB-GPG-KEY-puppet | sudo apt-key add -
$ echo "deb https://packages.netways.de/extras/debian buster main" | sudo tee /etc/apt/sources.list.d/netways-extras.list
$ echo "https://apt.puppet.com/puppet6-release-buster.deb" | sudo tee /etc/apt/sources.list.d/puppet6.list
$ apt update

$apt install icinga-installer puppet-agent
$ icinga-installer [-i] -S standalone
```

Example on Ubuntu Bionic Beaver:

```
$ wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
$ wget -O - https://apt.puppet.com/DEB-GPG-KEY-puppet | sudo apt-key add -
$ echo "deb https://packages.netways.de/extras/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/netways-extras.list
$ echo "https://apt.puppet.com/puppet6-release-bionic.deb" | sudo tee /etc/apt/sources.list.d/puppet6.list
$ apt update

$apt install icinga-installer puppet-agent
$ icinga-installer [-i] -S standalone
```

Example on Ubuntu Focal Fossa:

```
$ wget -O - https://packages.netways.de/netways-repo.asc | sudo apt-key add -
$ wget -O - https://apt.puppet.com/DEB-GPG-KEY-puppet | sudo apt-key add -
$ echo "deb https://packages.netways.de/extras/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/netways-extras.list
$ echo "https://apt.puppet.com/puppet6-release-focal.deb" | sudo tee /etc/apt/sources.list.d/puppet6.list
$ apt update

$apt install icinga-installer puppet-agent
$ icinga-installer [-i] -S standalone
```

Setup an Icinga 2 with MySQL support for IDO, an Apache and Icinga Web 2 using PHP-FPM. For Icinga Web 2 also a MySQL Backend is installed by default. To switch to PostgreSQL use the interactive Mode (icinga-installer -i).

By default the Icinga and EPEL repository are included by the installer.

The default Admin-Account for Icinga Web 2 is 'icingaadmin' and 'icinga' as password.
