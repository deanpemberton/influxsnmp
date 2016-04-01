#!/bin/sh
export GOPATH=/go

while /bin/true
do
$GOPATH/bin/influxsnmp -config $GOPATH/etc/config.gcfg -logs /log > /log/nohup.out
sleep 5
done
