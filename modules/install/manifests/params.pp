class install::params {

  $backend_db_password = extlib::cache_data('icinga_cache_data', 'ido_db_pass', extlib::random_password(32))
  $web_db_password     = extlib::cache_data('icinga_cache_data', 'web_db_pass', extlib::random_password(32))
  $ticket_salt         = extlib::cache_data('icinga_cache_data', 'server_ticket_salt', extlib::random_password(32))
  $web_api_password    = extlib::cache_data('icinga_cache_data', 'web_api_pass', extlib::random_password(32))

  case $facts['os']['family'] {
    'debian': {
      $manage_epel    = false
      $manage_plugins = true
      $manage_extras  = true
      $basic_plugins  = [ 'monitoring-plugins-basic', 'netways-plugins-mem' ]

      case $facts['os']['name'] {
        'debian': {
          if Integer($facts['os']['release']['major']) < 10 {
            $configure_backports = true
          } else {
            $configure_backports = false
          }
        } # os:debian
        'ubuntu': {
          $configure_backports = false
        } # os: ubuntu
      } 
    } # family: debian

    'redhat': {
      $configure_backports = false
      $nagios_plugins = [
        'nagios-plugins',
        'nagios-plugins-by_ssh',
        'nagios-plugins-cluster',
        'nagios-plugins-dhcp',
        'nagios-plugins-disk',
        'nagios-plugins-dummy',
        'nagios-plugins-file_age',
        'nagios-plugins-icmp',
        'nagios-plugins-http',
        'nagios-plugins-ide_smart',
        'nagios-plugins-ircd',
        'nagios-plugins-load',
        'nagios-plugins-log',
        'nagios-plugins-mrtg',
        'nagios-plugins-mrtgtraf',
        'nagios-plugins-nagios',
        'nagios-plugins-nt',
        'nagios-plugins-ntp',
        'nagios-plugins-nwstat',
        'nagios-plugins-overcr',
        'nagios-plugins-ping',
        'nagios-plugins-procs',
        'nagios-plugins-real',
        'nagios-plugins-sensors',
        'nagios-plugins-smtp',
        'nagios-plugins-ssh',
        'nagios-plugins-swap',
        'nagios-plugins-tcp',
        'nagios-plugins-time',
        'nagios-plugins-ups',
        'nagios-plugins-users', ]
      case $facts['os']['name'] {
        'redhat','centos': {
          $manage_epel    = true
          $manage_plugins = true
          $manage_extras  = true
          $basic_plugins  =  $nagios_plugins +  [ 'netways-plugins-mem' ]
        } # os: redhat
        default: {
          $manage_epel    = false
          $manage_plugins = true
          $manage_extras  = true
          $basic_plugins  = $nagios_plugins
        }
      }
    } # family: redhat

    default: {
      fail("The icinga-installer is'nt support on ${facts['os']['name']}")
    }
  }

}
