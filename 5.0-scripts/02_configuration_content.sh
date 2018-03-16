#!/bin/sh
# Script to update the 5.0-t1 virtual machine to the release version

SUDO=/usr/bin/sudo
MIRTH=/usr/local/mirthconnect

echo This 02 script changes the content of configuration files

$SUDO date


$SUDO sed -i -e 's-mirthconnect/mirth.properties-mirthconnect/conf/mirth.properties-g' $RSNA_ROOT/monitor-scripts/edgeserver_monitor.sh
if [[ $? -eq 0 ]]; then
 echo "Change mirth.properties path in: /monitor-scripts/edgeserver_monitor.sh"
else
 echo "Fail: Change mirth.properties path in: /monitor-scripts/edgeserver_monitor.sh"
 exit 1
fi

$SUDO sed -i -e 's-  trust-  md5-g' /data/pg_hba.conf
if [[ $? -eq 0 ]]; then
 echo "Change database access trust/md5 in /data/ph_hba.conf"
else
 echo "Fail: Change database access trust/md5 in /data/ph_hba.conf"
 exit 1
fi

