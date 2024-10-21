# Repositories

All extension and adjustments made here refer to file `/etc/icinga-installer/custom-hiera.yaml`.

## Subscription for RHEL/CentOS/Rocky/AlmaLinux 8 and higher

```yaml
icinga::repos:
  icinga-stable-release:
    baseurl: 'https://packages.icinga.com/subscription/rhel/$releasever/release/'
    username: <username>
    password: *****
```

## Installing from Non-Upstream Repositories

To change to a non upstream repository, e.g. a local mirror, the repos can be customized via hiera. The module does a deep merge lookup for a hash named icinga::repos. Allowed keys are:

* icinga-stable-release
* epel (only on RHEL platforms)
* powertools (only RHEL 8 platforms)
* crb (only RHEL 9 platforms)
* netways-plugins
* netways-extras

IMPORTANT: The configuration hash depends on the platform and requires one of the following resources:

* apt::source (Debian family, see [apt::source](https://github.com/puppetlabs/puppetlabs-apt/blob/main/REFERENCE.md#apt--source) and [apt::key](https://github.com/puppetlabs/puppetlabs-apt/blob/main/REFERENCE.md#apt--key) for subparameter 'key')
* yumrepo (RedHat family, see [yumrepo](https://github.com/puppetlabs/puppetlabs-yumrepo_core/blob/main/REFERENCE.md#yumrepo))

### Examples YUM Repositories

```yaml
icinga::repos:
  icinga-stable-release:
    baseurl: https://repo.example.com/icinga/epel/$releasever/release/
    gpgkey: https://repo.example.com/icinga/icinga.key
```

### Examples Debian Repositories

```yaml
icinga::repos:
  icinga-stable-release:
    location: https://repo.example.com/icinga/debian
    release: icinga-bullseye
    repos: main
    key:
      source: https://repo.example.com/debian/bullseye.asc
```
    
Also the Backports repo on Debian can be configured like the apt class of course, see [apt::backports](https://github.com/puppetlabs/puppetlabs-apt/blob/main/REFERENCE.md#apt--backports).

NOTICE: Backports is required for Debian Buster!

```yaml
apt::backports::location: https://repo.example.com/debian
apt::backports::release:: buster-backports
apt::backports::repos: main universe restricted
apt::backports::key:
  source: https://repo.example.com/debian/buster.asc
```
