# Certificates

This section shows how to transfer certificates or even the CA, e.g. from a previous installation. The adjustments for this goes to file `/etc/icinga-installer/custom-hiera.yaml`.

NOTICE: The indentation here (multiline string) is intentionally just a blank!

## CA Transfer

```yaml
icinga2::pki::ca::ca_key: |
 -----BEGIN RSA PRIVATE KEY-----
 ...
icinga2::pki::ca::ca_cert: |
 -----BEGIN CERTIFICATE-----
 ...
```

## Certificate Transfer

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
