# @summary
# This class installs monitoring plugins.
#
# @param [Variant[String, Array[String]]] basic_plugins
#   Manage what plugins have to be installed.
#
class install::plugins(
  Variant[String, Array[String]]   $basic_plugins = $install::params::basic_plugins,
) inherits install::params {

  package { $basic_plugins: } 

}
