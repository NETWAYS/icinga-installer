# Apache

The Installer sets up an Apache web server with FPM for PHP for use with Icinga Web 2. To protect the Apache configuration against loss when the Installer runs again, you should also configure the web server exclusively via `/etc/icinga-installer/custom-hiera.yaml`. 

As an example, we will use the global activation of TLS, including a global redirection of all HTTP requests to HTTPS.

```yaml
apache::default_ssl_vhost: true
apache::default_ssl_cert: <location of the apache certificate>
apache::default_ssl_key: <location of the private key>

apache::default_vhost: false
apache::vhosts::vhosts:
  custom-default:
    port: 80
    docroot: false
    priority: '15'
    manage_docroot: false
    rewrite_rule: ^ https://%%{}{SERVER_NAME}%%{}{REQUEST_URI} [END,NE,R=permanent]
    use_servername_for_filenames: true
    use_port_for_filenames: true
```

For more details, check out the [documentation of the apache puppet module](https://github.com/puppetlabs/puppetlabs-apache/blob/main/REFERENCE.md).

To hardening your Apache setup, disable tracing and restricts HTTPS to the TLS 1.2 and 1.3 protocol families:

```yaml
apache::trace_enable: 'Off'
apache::mod::ssl::ssl_protocol:
  - '-all'
  - '+TLSv1.2'
  - '+TLSv1.3'
```

Or maybe be we won't use the default Apache config of Icinga Web and make it available directly via a vhost:

```yaml
icinga::web::apache_config: false
apache::vhosts::vhosts:
  icinga.example.com:
    port: 443
    docroot: /usr/share/icingaweb2/public
    priority: '30'
    manage_docroot: false
    use_servername_for_filenames: true
    use_port_for_filenames: true
    custom_fragment: EnableSendfile Off
    directories:
      - path: /usr/share/icingaweb2/public
        options: [ 'SymLinksIfOwnerMatch' ]
        allow_override: [ 'None' ]
        directoryindex: index.php
        setenv:
          - ICINGAWEB_CONFIGDIR "/etc/icingaweb2"
        rewrites:
          - rewrite_cond:
              - '%%{}{REQUEST_FILENAME} -s [OR]'
              - '%%{}{REQUEST_FILENAME} -l [OR]'
              - '%%{}{REQUEST_FILENAME} -d'
            rewrite_rule:
              - '^.*$ - [NC,L]'
              - '^.*$ index.php [NC,L]'
        addhandlers:
          -  extensions: [ 'php' ]
             handler: 'proxy:fcgi://127.0.0.1:9000'
    ssl: true
    ssl_key: /etc/pki/tls/private/icinga.example.com.key
    ssl_cert: /etc/pki/tls/certs/icinga.example.com.crt
```

Another new feature since version 2 is the option to load additional Apache modules and configure them using the Apache Puppet module.

```yaml
icinga::web::apache_extra_mods:
  - wsgi
  - reqtimeout
apache::mod::reqtimeout::timeouts:
  - 'header=20-40,minrate=1000'
  - 'body=10,minrate=1000'
```
