#!/bin/bash
set -e

configfile="/opt/knxd/default.cfg"

if [ -e "$configfile" ]
then
    echo "configfile found"
else
    exec /usr/local/libexec/knxd_args -t 1023 -e 15.15.1 -E 15.15.2:8 -TRS -b ipt:192.168.178.230 > "$configfile"
fi
