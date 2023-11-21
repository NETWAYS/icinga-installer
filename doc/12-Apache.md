# Apache

The Installer sets up an Apache web server with FPM for PHP for use with Icinga Web 2. To protect the Apache configuration against loss when the Installer runs again, you should also configure the web server exclusively via `/etc/icinga-installer/custom-hiera.yaml. 

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
