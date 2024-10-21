# Scenarios

## Servers

* server-db-mysql|server-db-pgsql: Install Server based on MySQL|PostgreSQL with IcingaDB as Backend.
* server-ido-mysql|server-ido-pgsql: same but with the deprecated IDO Backend instead of IcingaDB.

If your server should have connected workers, you have to configure those in `/etc/icinga-installer/custom-hiera.yaml`:

```yaml
icinga::server::workers:
  dmz:
    endpoints:
      'worker.dmzdomain':
        host: 192.168.66.92
```

The example above describes a server with one worker zone `dmz` served by one Icinga instance `worker.dmzdomain` (192.168.66.92).

## Workers (aka Satellites)

The configuration of a connection on the server is described above. Then do the following on the worker itself:

```bash
$ icinga-installer -S worker --ca-server 192.168.1.32 --zone dmz --parent-endpoints ubuntu22.icinga.installer:host:192.168.1.32 
```

The Server here is located on `192.168.1.32`. Alternatively, the required settings can of course also be made in interactive mode (`icinga-installer -S worker -i`).

## Agents

Configuring an agent is very similar to configuring a worker. But of course, the scenario is different:

```bash
$ icinga-installer -S agent --ca-server 192.168.1.32 --parent-endpoints ubuntu22.icinga.installer:host:192.168.1.32 
```

Here the agent is connected directly to the server, a connection to a worker is also possible. But here additionally the name of the zone of the worker must be specified, because of course there can be no standard for this.

```bash
$ icinga-installer -S agent --ca-server 192.168.66.92 --parent-zone dmz --parent-endpoints ubuntu22.icinga.installer:host:192.168.66.92 
```

Alternatively, all settings can be made in interactive mode (`icinga-installer -S agent -i`).
