influxsnmp
==========
Poll network devices via SNMP and save the data in InfluxDB (version 0.9.x)

It requires mib oids to be "pre-digested", e.g.,

    snmptranslate -M $MIBDIR -Tz -On -m IF-MIB | sed -e 's/"//g' > oids.txt

The results from the above are included in the project as a start.


Running in Docker
=================

It is possible to run influxsnmp inside a Docker container using the included Dockerfile.
Pass in the config as volumes from the host.  This way you can start containers for monitoring different hosts, or set of hosts.

    docker run  -v ${PWD}/sample_config.gcfg:/go/etc/config.gcfg -v ${PWD}/sample_ports.txt:/go/bin/ports.txt --name=influxsnmp -d   influxsnmp


