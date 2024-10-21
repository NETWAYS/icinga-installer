# Certificates

This section describes how to handle certificates and the CA. All customizations are done in file `/etc/icinga-installer/custom-hiera.yaml`.

## Certificate Name

All certificates have the FQDN by default. To replace the name with an own choice add the following line:

```yaml
icinga::cert_name: "%{facts.networking.hostname}"
```

The example above uses a fact to set the certname to the short host name. Any scalar string is of course also permitted.

## CA Transfer

Here it's shown how to transfer the CA, e.g. from a previous installation.

```yaml
icinga2::pki::ca::ca_key: |
 -----BEGIN RSA PRIVATE KEY-----
 ...
icinga2::pki::ca::ca_cert: |
 -----BEGIN CERTIFICATE-----
 ...
```

NOTICE: The indentation here (multiline string) is intentionally just a blank!

## Certificate Transfer

The content of the certificate for Icinga itself can also be set or transferred.

```yaml
icinga2::feature::api::ssl_cacert: |
 -----BEGIN CERTIFICATE-----
 ...
icinga2::feature::api::ssl_key: |
 -----BEGIN RSA PRIVATE KEY-----
 ...
icinga2::feature::api::ssl_cert: |
 -----BEGIN CERTIFICATE-----
 ...
```

NOTICE: The indentation here (multiline string) is intentionally just a blank!
