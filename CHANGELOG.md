# Change Log

## [v1.1.0](https://github.com/netways/icinga-installer/tree/v1.1.0) (2023-03-06)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.0.0...v1.1.0)

**Implemented enhancements:**

- Add support for reporting [\#55](https://github.com/NETWAYS/icinga-installer/pull/55) ([lbetz](https://github.com/lbetz))

**Closed issues:**

- Add web modules for reporting [\#22](https://github.com/NETWAYS/icinga-installer/issues/22)

## [v1.0.0](https://github.com/netways/icinga-installer/tree/v1.0.0) (2023-02-11)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.7.1...v1.0.0)

**Implemented enhancements:**

- Rename head master branch to main [\#53](https://github.com/NETWAYS/icinga-installer/issues/53)
- Add feature influxdb2 [\#31](https://github.com/NETWAYS/icinga-installer/issues/31)
- Add support for IcingaDB [\#54](https://github.com/NETWAYS/icinga-installer/pull/54) ([lbetz](https://github.com/lbetz))
- Rebuild interactive structure and change some parameter names [\#52](https://github.com/NETWAYS/icinga-installer/pull/52) ([lbetz](https://github.com/lbetz))

**Merged pull requests:**

- Bump puppet/php to v8.2.0 [\#51](https://github.com/NETWAYS/icinga-installer/pull/51) ([martialblog](https://github.com/martialblog))

## [v0.7.1](https://github.com/netways/icinga-installer/tree/v0.7.1) (2022-08-01)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.7.0...v0.7.1)

**Fixed bugs:**

- Scenario server-ido-mysql failed on RHEL/CentOS 7 [\#49](https://github.com/NETWAYS/icinga-installer/issues/49)

## [v0.7.0](https://github.com/netways/icinga-installer/tree/v0.7.0) (2022-07-26)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.6.3...v0.7.0)

**Implemented enhancements:**

- Update icingaweb2 module to v3.4.1 [\#47](https://github.com/NETWAYS/icinga-installer/issues/47)
- Update icinga module to v2.8.0 [\#46](https://github.com/NETWAYS/icinga-installer/issues/46)
- Update icinga2 module to v3.4.0 [\#45](https://github.com/NETWAYS/icinga-installer/issues/45)
- Add Alma and Rocky Linux support [\#38](https://github.com/NETWAYS/icinga-installer/issues/38)
- Add management of powertools repo [\#37](https://github.com/NETWAYS/icinga-installer/issues/37)
- Add a randomize initial icingaadmin password [\#26](https://github.com/NETWAYS/icinga-installer/issues/26)

**Fixed bugs:**

- Missing epel repo for AlmaLinux und Rocky [\#48](https://github.com/NETWAYS/icinga-installer/issues/48)

## [v0.6.3](https://github.com/netways/icinga-installer/tree/v0.6.3) (2022-06-08)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.6.2...v0.6.3)

**Fixed bugs:**

- Update puppet module icinga2 to bugfix release 3.3.1 [\#41](https://github.com/NETWAYS/icinga-installer/issues/41)

## [v0.6.2](https://github.com/netways/icinga-installer/tree/v0.6.2) (2022-05-31)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.6.1...v0.6.2)

**Implemented enhancements:**

- Add additional module path for icingaweb2 [\#40](https://github.com/NETWAYS/icinga-installer/issues/40)

**Fixed bugs:**

- Apache does not start on RHEL7 because of unknown option CGIPassAuth [\#33](https://github.com/NETWAYS/icinga-installer/issues/33)

**Closed issues:**

- Add the requirement of Icinga subscription on RHEL 8 based systems [\#39](https://github.com/NETWAYS/icinga-installer/issues/39)
- Add to documentation how to setup PHP 7.4 on CentOS8 [\#35](https://github.com/NETWAYS/icinga-installer/issues/35)
- Add how to install on RHEL to documentation [\#34](https://github.com/NETWAYS/icinga-installer/issues/34)

## [v0.6.1](https://github.com/netways/icinga-installer/tree/v0.6.1) (2022-01-29)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.6.0...v0.6.1)

**Fixed bugs:**

- Update icingaweb2 module - AddCGIPassAuth to Apache config [\#32](https://github.com/NETWAYS/icinga-installer/issues/32)
- Add misisng class apache::vhosts [\#30](https://github.com/NETWAYS/icinga-installer/issues/30)

## [v0.6.0](https://github.com/netways/icinga-installer/tree/v0.6.0) (2022-01-18)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.5.0...v0.6.0)

**Implemented enhancements:**

- Drop Debian stretch support [\#29](https://github.com/NETWAYS/icinga-installer/issues/29)
- Add web module fileshipper [\#21](https://github.com/NETWAYS/icinga-installer/issues/21)
- Support puppet7, drop puppet5 [\#20](https://github.com/NETWAYS/icinga-installer/issues/20)

**Fixed bugs:**

- new apt key for puppet repo [\#19](https://github.com/NETWAYS/icinga-installer/issues/19)
- Disable businessprocess does not disable the module [\#28](https://github.com/NETWAYS/icinga-installer/issues/28)
- Disable director does not disable the module [\#25](https://github.com/NETWAYS/icinga-installer/issues/25)
- Updating Apache after installation breaks Apache config on RHEL [\#24](https://github.com/NETWAYS/icinga-installer/issues/24)

## [v0.5.0](https://github.com/netways/icinga-installer/tree/v0.5.0) (2021-11-08)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.4.5...v0.5.0)

**Implemented enhancements:**

- Add support for Debian Bullseye [\#16](https://github.com/NETWAYS/icinga-installer/issues/16)
- add icingaweb2-module-director [\#7](https://github.com/NETWAYS/icinga-installer/issues/7)

**Fixed bugs:**

- Small fixes to documentation [\#17](https://github.com/NETWAYS/icinga-installer/pull/17) ([widhalmt](https://github.com/widhalmt))

## [v0.4.5](https://github.com/netways/icinga-installer/tree/v0.4.5) (2021-09-03)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.4.3...v0.4.5)

**Fixed bugs:**

- Downgrad postgresql puppet module to v6.9.0 [\#15](https://github.com/NETWAYS/icinga-installer/issues/15)
- Cannot install PostgreSQL IDO with Puppet 5 [\#14](https://github.com/NETWAYS/icinga-installer/issues/14)

## [v0.4.3](https://github.com/netways/icinga-installer/tree/v0.4.3) (2021-08-17)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.4.2...v0.4.3)

**Fixed bugs:**

- Resource type not found Icinga2::LogSeverity [\#13](https://github.com/NETWAYS/icinga-installer/issues/13)

## [v0.4.2](https://github.com/netways/icinga-installer/tree/v0.4.2) (2021-07-16)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.4.1...v0.4.2)

**Implemented enhancements:**

- Add module businessprocess [\#11](https://github.com/NETWAYS/icinga-installer/issues/11)
- Rename scenario server to server-ido-mysql [\#10](https://github.com/NETWAYS/icinga-installer/issues/10)
- Re-add scenario server-pgsql [\#9](https://github.com/NETWAYS/icinga-installer/issues/9)

## [v0.4.1](https://github.com/netways/icinga-installer/tree/v0.4.1) (2021-06-21)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.4.0...v0.4.1)

## [v0.4.0](https://github.com/netways/icinga-installer/tree/v0.4.0) (2021-06-18)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.3.0...v0.4.0)

**Implemented enhancements:**

- add icingaweb2-module-businessprocess [\#3](https://github.com/NETWAYS/icinga-installer/issues/3)
- add feature livestatus [\#6](https://github.com/NETWAYS/icinga-installer/issues/6)
- add feature influxdb [\#5](https://github.com/NETWAYS/icinga-installer/issues/5)
- add feature graphite [\#4](https://github.com/NETWAYS/icinga-installer/issues/4)

## [v0.3.0](https://github.com/netways/icinga-installer/tree/v0.3.0) (2021-03-15)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.2.1...v0.3.0)

**Implemented enhancements:**

- add new scenario server-pgsql [\#2](https://github.com/NETWAYS/icinga-installer/issues/2)
- pin puppetfile versions [\#1](https://github.com/NETWAYS/icinga-installer/issues/1)

## [v0.2.1](https://github.com/netways/icinga-installer/tree/v0.2.1) (2021-03-04)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.2.0...v0.2.1)

## [v0.2.0](https://github.com/netways/icinga-installer/tree/v0.2.0) (2021-03-04)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.1.3...v0.2.0)

## [v0.1.3](https://github.com/netways/icinga-installer/tree/v0.1.3) (2021-02-26)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.1.2...v0.1.3)

## [v0.1.2](https://github.com/netways/icinga-installer/tree/v0.1.2) (2021-02-23)
[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.1.1...v0.1.2)

## [v0.1.1](https://github.com/netways/icinga-installer/tree/v0.1.1) (2021-02-22)


\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*