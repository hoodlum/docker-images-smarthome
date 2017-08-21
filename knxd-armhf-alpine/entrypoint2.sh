#!/bin/bash
set -e

configfile="/opt/knxd/default.cfg"

if [ -e $configfile ]; then
    echo "configfile found, nothing todo"
else
    echo "raw args: $@"
    if [ "${1:0:1}" = '-' ]; then
        command="/usr/local/libexec/knxd_args $@ > $configfile"
        echo "create configfile: $command"
        eval $command
    fi
fi

echo "execute KNXD"
exec knxd $configfile
