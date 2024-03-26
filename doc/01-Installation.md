# Installation

All commands have to be performed as user `root`.

## RHEL 7:

```bash
subscription-manager repos --enable rhel-7-server-optional-rpms
subscription-manager repos --enable rhel-server-rhscl-7-rpms

yum install -y https://packages.netways.de/extras/epel/7/noarch/netways-extras-release/netways-extras-release-7-1.el7.netways.noarch.rpm
yum install -y https://yum.puppet.com/puppet7/puppet7-release-el-7.noarch.rpm

yum install -y icinga-installer
```

## CentOS 7:

```bash
yum install -y centos-release-scl

yum install -y https://packages.netways.de/extras/epel/7/noarch/netways-extras-release/netways-extras-release-7-1.el7.netways.noarch.rpm
yum install -y https://yum.puppet.com/puppet7-release-el-7.noarch.rpm

yum install -y icinga-installer
```

## RHEL/AlmaLinux/Rocky 8 and CentOS Stream 8:

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

Username `<username>` and password `<password>` must be set according to your subscription.


## RHEL/AlmaLinux/Rocky 9 and CentOS Stream 9:

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

Username `<username>` and password `<password>` must be set according to your subscription.


## Debian Bullseye:

```bash
apt install wget apt-transport-https gpg
get -O - https://packages.netways.de/netways-repo.asc | apt-key add -
echo "deb https://packages.netways.de/extras/debian bullseye main" | tee /etc/apt/sources.list.d/netways-extras-release.list
wget -O - https://apt.puppetlabs.com/DEB-GPG-KEY-puppet-20250406 | apt-key add -
echo "deb https://apt.puppetlabs.com bullseye puppet7" | tee /etc/apt/sources.list.d/puppet7.list
apt update

apt install -y icinga-installer
```

## Debian Bookworm:

```bash
apt install -y wget apt-transport-https gpg
wget -O /etc/apt/keyrings/netways-repo.asc  https://packages.netways.de/netways-repo.asc
echo "deb [signed-by=/etc/apt/keyrings/netways-repo.asc] https://packages.netways.de/extras/debian bookworm main" | tee /etc/apt/sources.list.d/netways-extras-release.list
wget -O -  https://apt.puppetlabs.com/DEB-GPG-KEY-puppet-20250406 | gpg --dearmor -o /usr/share/keyrings/puppet-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/puppet-archive-keyring.gpg] https://apt.puppetlabs.com bookworm puppet7" | tee /etc/apt/sources.list.d/puppet7.list
apt update

apt install -y icinga-installer
```

## Ubuntu Focal Fossa:

```bash
apt install -y ca-certificates wget apt-transport-https gpg
wget -O - https://packages.netways.de/netways-repo.asc | apt-key add -
echo "deb https://packages.netways.de/extras/ubuntu focal main" | tee /etc/apt/sources.list.d/netways-extras-release.list
wget -O - https://apt.puppetlabs.com/DEB-GPG-KEY-puppet-20250406 | apt-key add -
echo "deb https://apt.puppetlabs.com focal puppet7" | tee /etc/apt/sources.list.d/puppet7.list
apt update

apt install -y icinga-installer
```

## Ubuntu Jammy Jellyfish:

```bash
apt install wget apt-transport-https gpg
wget -O -  https://packages.netways.de/netways-repo.asc | gpg --dearmor -o /usr/share/keyrings/netways-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/netways-archive-keyring.gpg] https://packages.netways.de/extras/ubuntu jammy main" | tee /etc/apt/sources.list.d/netways-extras-release.list
wget -O -  https://apt.puppetlabs.com/DEB-GPG-KEY-puppet-20250406 | gpg --dearmor -o /usr/share/keyrings/puppet-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/puppet-archive-keyring.gpg] https://apt.puppetlabs.com jammy puppet7" | tee /etc/apt/sources.list.d/puppet7.list
apt update

apt install -y icinga-installer
```
