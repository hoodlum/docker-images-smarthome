#!/bin/bash
set -e

perl=/usr/bin/perl
fhem=/usr/local/lib/fhem/fhem.pl

configfile=/opt/fhem/fhem.cfg

if [ -e $configfile ]; then
    echo "configfile found, nothing todo"
else
    echo -e 'attr global nofork 1\n' > $configfile
    echo -e 'attr global modpath /usr/local/lib/fhem\n' >> $configfile
    echo -e 'attr global logfile /opt/fhem/fhem.log\n' >> $configfile
    echo -e 'define WEB FHEMWEB 8083 global\n' >> $configfile
    echo -e 'attr WEB editConfig 1\n' >> $configfile
fi

echo "execute FHEM"
exec $perl $fhem $configfile
