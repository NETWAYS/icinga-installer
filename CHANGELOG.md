# Changelog

## [v2.0.0](https://github.com/netways/icinga-installer/tree/v2.0.0) (2024-08-20)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.3.2...v2.0.0)

**Fixed bugs:**

- \[Bug\]:  packages.icinga.com gpg gets placed in the legacy location \(debian bookworm at least\) [\#86](https://github.com/NETWAYS/icinga-installer/issues/86)

**Closed issues:**

- Drop EOL EL7 support [\#90](https://github.com/NETWAYS/icinga-installer/issues/90)
- Add SELinux support for Agent and Worker [\#89](https://github.com/NETWAYS/icinga-installer/issues/89)

## [v1.3.2](https://github.com/netways/icinga-installer/tree/v1.3.2) (2024-08-17)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.3.1...v1.3.2)

## [v1.3.1](https://github.com/netways/icinga-installer/tree/v1.3.1) (2024-07-02)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.3.0...v1.3.1)

**Fixed bugs:**

- Update icingadb module to fix a bug with the new icingadb-redis package from Icinga [\#88](https://github.com/NETWAYS/icinga-installer/issues/88)

**Merged pull requests:**

- Add doc how to change the default certifacte name. [\#87](https://github.com/NETWAYS/icinga-installer/pull/87) ([lbetz](https://github.com/lbetz))
- Fix documentation for debian [\#85](https://github.com/NETWAYS/icinga-installer/pull/85) ([RincewindsHat](https://github.com/RincewindsHat))

## [v1.3.0](https://github.com/netways/icinga-installer/tree/v1.3.0) (2024-02-16)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.2.8...v1.3.0)

**Closed issues:**

- Add Debian Bookworm Support [\#74](https://github.com/NETWAYS/icinga-installer/issues/74)

## [v1.2.8](https://github.com/netways/icinga-installer/tree/v1.2.8) (2024-01-05)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.2.7...v1.2.8)

**Fixed bugs:**

- \[Bug\]: Redis password isn't set in Icinga2 feature [\#84](https://github.com/NETWAYS/icinga-installer/issues/84)

**Merged pull requests:**

- Add Issue Templates [\#83](https://github.com/NETWAYS/icinga-installer/pull/83) ([martialblog](https://github.com/martialblog))

## [v1.2.7](https://github.com/netways/icinga-installer/tree/v1.2.7) (2023-11-21)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.2.6...v1.2.7)

**Fixed bugs:**

- Port for director db connection is not passed [\#80](https://github.com/NETWAYS/icinga-installer/issues/80)
- Add missing general monitoring settings [\#82](https://github.com/NETWAYS/icinga-installer/pull/82) ([lbetz](https://github.com/lbetz))

**Merged pull requests:**

- Update to icingaweb2 module v3.10.0 [\#81](https://github.com/NETWAYS/icinga-installer/pull/81) ([lbetz](https://github.com/lbetz))

## [v1.2.6](https://github.com/netways/icinga-installer/tree/v1.2.6) (2023-10-04)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.2.5...v1.2.6)

**Fixed bugs:**

- Some fixes to install only icingaweb2 with icingadb module [\#79](https://github.com/NETWAYS/icinga-installer/issues/79)

## [v1.2.5](https://github.com/netways/icinga-installer/tree/v1.2.5) (2023-07-17)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.2.4...v1.2.5)

**Fixed bugs:**

- Manage some config file as empty to protect apache updates on RHEL [\#77](https://github.com/NETWAYS/icinga-installer/issues/77)
- Running Puppet on Debian or Ubuntu [\#76](https://github.com/NETWAYS/icinga-installer/issues/76)
- Manage PHP apache config file  as empty to protect apache updates [\#75](https://github.com/NETWAYS/icinga-installer/pull/75) ([lbetz](https://github.com/lbetz))

## [v1.2.4](https://github.com/netways/icinga-installer/tree/v1.2.4) (2023-05-12)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.2.3...v1.2.4)

**Fixed bugs:**

- Wrong description in all four server scenarios [\#67](https://github.com/NETWAYS/icinga-installer/issues/67)
- Set value of ldap\_nested\_group\_search for groupbackend in examples [\#66](https://github.com/NETWAYS/icinga-installer/issues/66)
- fix wrong params in server [\#73](https://github.com/NETWAYS/icinga-installer/pull/73) ([lbetz](https://github.com/lbetz))
- change naming of scenario listing  [\#68](https://github.com/NETWAYS/icinga-installer/pull/68) ([carraroj](https://github.com/carraroj))

**Merged pull requests:**

- Update README and installation docs [\#71](https://github.com/NETWAYS/icinga-installer/pull/71) ([martialblog](https://github.com/martialblog))
- Extend setup doc with required additional packages [\#72](https://github.com/NETWAYS/icinga-installer/pull/72) ([lbetz](https://github.com/lbetz))
- Update README [\#70](https://github.com/NETWAYS/icinga-installer/pull/70) ([martialblog](https://github.com/martialblog))

## [v1.2.3](https://github.com/netways/icinga-installer/tree/v1.2.3) (2023-04-19)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.2.2...v1.2.3)

**Fixed bugs:**

- Mysql::Db\[icingadb\]: parameter 'tls\_options' expects a value of type Undef or Array, got String [\#64](https://github.com/NETWAYS/icinga-installer/issues/64)
- Downgrade mysql module because of api changes for tis\_options in mysql::db [\#65](https://github.com/NETWAYS/icinga-installer/pull/65) ([lbetz](https://github.com/lbetz))

## [v1.2.2](https://github.com/netways/icinga-installer/tree/v1.2.2) (2023-04-15)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.2.1...v1.2.2)

**Fixed bugs:**

- Missing `UTF8` setting in database ressources for icingaweb2 [\#62](https://github.com/NETWAYS/icinga-installer/issues/62)
- Update minor and bugfix releases of some puppet modules [\#63](https://github.com/NETWAYS/icinga-installer/pull/63) ([lbetz](https://github.com/lbetz))

## [v1.2.1](https://github.com/netways/icinga-installer/tree/v1.2.1) (2023-04-03)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.2.0...v1.2.1)

**Fixed bugs:**

- Updating Apache after installation breaks Apache config on RHEL 8/9 [\#61](https://github.com/NETWAYS/icinga-installer/issues/61)
- Wrong default ido\_db\_type in scenario server-db-mysql  [\#59](https://github.com/NETWAYS/icinga-installer/issues/59)

**Closed issues:**

- Add example to custom hiera [\#27](https://github.com/NETWAYS/icinga-installer/issues/27)

**Merged pull requests:**

- Add more stuff to the documentation [\#60](https://github.com/NETWAYS/icinga-installer/pull/60) ([lbetz](https://github.com/lbetz))

## [v1.2.0](https://github.com/netways/icinga-installer/tree/v1.2.0) (2023-03-11)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.1.0...v1.2.0)

**Closed issues:**

- Add support for additional apache vhost configs [\#58](https://github.com/NETWAYS/icinga-installer/issues/58)
- Install icingaweb2 model pdfexport by default [\#57](https://github.com/NETWAYS/icinga-installer/issues/57)
- Do not manage roles.ini after default setup [\#56](https://github.com/NETWAYS/icinga-installer/issues/56)
- Support auth method LDAP and Active Directory [\#23](https://github.com/NETWAYS/icinga-installer/issues/23)

## [v1.1.0](https://github.com/netways/icinga-installer/tree/v1.1.0) (2023-03-06)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v1.0.0...v1.1.0)

**Closed issues:**

- Add web modules for reporting [\#22](https://github.com/NETWAYS/icinga-installer/issues/22)

**Merged pull requests:**

- Add support for reporting [\#55](https://github.com/NETWAYS/icinga-installer/pull/55) ([lbetz](https://github.com/lbetz))

## [v1.0.0](https://github.com/netways/icinga-installer/tree/v1.0.0) (2023-02-11)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.7.1...v1.0.0)

**Closed issues:**

- Rename head master branch to main [\#53](https://github.com/NETWAYS/icinga-installer/issues/53)
- Add feature influxdb2 [\#31](https://github.com/NETWAYS/icinga-installer/issues/31)

**Merged pull requests:**

- Bump puppet/php to v8.2.0 [\#51](https://github.com/NETWAYS/icinga-installer/pull/51) ([martialblog](https://github.com/martialblog))
- Add support for IcingaDB [\#54](https://github.com/NETWAYS/icinga-installer/pull/54) ([lbetz](https://github.com/lbetz))
- Rebuild interactive structure and change some parameter names [\#52](https://github.com/NETWAYS/icinga-installer/pull/52) ([lbetz](https://github.com/lbetz))

## [v0.7.1](https://github.com/netways/icinga-installer/tree/v0.7.1) (2022-08-01)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.7.0...v0.7.1)

**Fixed bugs:**

- Scenario server-ido-mysql failed on RHEL/CentOS 7 [\#49](https://github.com/NETWAYS/icinga-installer/issues/49)

## [v0.7.0](https://github.com/netways/icinga-installer/tree/v0.7.0) (2022-07-26)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.6.3...v0.7.0)

**Fixed bugs:**

- Missing epel repo for AlmaLinux und Rocky [\#48](https://github.com/NETWAYS/icinga-installer/issues/48)

**Closed issues:**

- Update icingaweb2 module to v3.4.1 [\#47](https://github.com/NETWAYS/icinga-installer/issues/47)
- Update icinga module to v2.8.0 [\#46](https://github.com/NETWAYS/icinga-installer/issues/46)
- Update icinga2 module to v3.4.0 [\#45](https://github.com/NETWAYS/icinga-installer/issues/45)
- Add Alma and Rocky Linux support [\#38](https://github.com/NETWAYS/icinga-installer/issues/38)
- Add management of powertools repo [\#37](https://github.com/NETWAYS/icinga-installer/issues/37)
- Add a randomize initial icingaadmin password [\#26](https://github.com/NETWAYS/icinga-installer/issues/26)

## [v0.6.3](https://github.com/netways/icinga-installer/tree/v0.6.3) (2022-06-08)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.6.2...v0.6.3)

**Fixed bugs:**

- Update puppet module icinga2 to bugfix release 3.3.1 [\#41](https://github.com/NETWAYS/icinga-installer/issues/41)

## [v0.6.2](https://github.com/netways/icinga-installer/tree/v0.6.2) (2022-05-31)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.6.1...v0.6.2)

**Fixed bugs:**

- Apache does not start on RHEL7 because of unknown option CGIPassAuth [\#33](https://github.com/NETWAYS/icinga-installer/issues/33)

**Closed issues:**

- Add additional module path for icingaweb2 [\#40](https://github.com/NETWAYS/icinga-installer/issues/40)
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

**Fixed bugs:**

- new apt key for puppet repo [\#19](https://github.com/NETWAYS/icinga-installer/issues/19)
- Disable businessprocess does not disable the module [\#28](https://github.com/NETWAYS/icinga-installer/issues/28)
- Disable director does not disable the module [\#25](https://github.com/NETWAYS/icinga-installer/issues/25)
- Updating Apache after installation breaks Apache config on RHEL [\#24](https://github.com/NETWAYS/icinga-installer/issues/24)

**Closed issues:**

- Drop Debian stretch support [\#29](https://github.com/NETWAYS/icinga-installer/issues/29)
- Add web module fileshipper [\#21](https://github.com/NETWAYS/icinga-installer/issues/21)
- Support puppet7, drop puppet5 [\#20](https://github.com/NETWAYS/icinga-installer/issues/20)

## [v0.5.0](https://github.com/netways/icinga-installer/tree/v0.5.0) (2021-11-08)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.4.5...v0.5.0)

**Fixed bugs:**

- Small fixes to documentation [\#17](https://github.com/NETWAYS/icinga-installer/pull/17) ([widhalmt](https://github.com/widhalmt))

**Closed issues:**

- Add support for Debian Bullseye [\#16](https://github.com/NETWAYS/icinga-installer/issues/16)
- add icingaweb2-module-director [\#7](https://github.com/NETWAYS/icinga-installer/issues/7)

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

**Closed issues:**

- Add module businessprocess [\#11](https://github.com/NETWAYS/icinga-installer/issues/11)
- Rename scenario server to server-ido-mysql [\#10](https://github.com/NETWAYS/icinga-installer/issues/10)
- Re-add scenario server-pgsql [\#9](https://github.com/NETWAYS/icinga-installer/issues/9)

## [v0.4.1](https://github.com/netways/icinga-installer/tree/v0.4.1) (2021-06-21)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.4.0...v0.4.1)

## [v0.4.0](https://github.com/netways/icinga-installer/tree/v0.4.0) (2021-06-18)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.3.0...v0.4.0)

**Closed issues:**

- add icingaweb2-module-businessprocess [\#3](https://github.com/NETWAYS/icinga-installer/issues/3)
- add feature livestatus [\#6](https://github.com/NETWAYS/icinga-installer/issues/6)
- add feature influxdb [\#5](https://github.com/NETWAYS/icinga-installer/issues/5)
- add feature graphite [\#4](https://github.com/NETWAYS/icinga-installer/issues/4)

## [v0.3.0](https://github.com/netways/icinga-installer/tree/v0.3.0) (2021-03-15)

[Full Changelog](https://github.com/netways/icinga-installer/compare/v0.2.1...v0.3.0)

**Closed issues:**

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

[Full Changelog](https://github.com/netways/icinga-installer/compare/6e626639c049c3a984213f614902a4e031060dca...v0.1.1)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
