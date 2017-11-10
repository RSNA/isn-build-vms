#!/bin/sh
# Script to update the 5.0-t1 virtual machine to the release version

SUDO=/usr/bin/sudo
MIRTH=/usr/local/mirthconnect

local_chmod()
{
 MODE=$1
 PATH=$2
 shift; shift;

 $SUDO chmod $MODE $PATH
 if [[ $? -eq 0 ]]; then
  echo "chmod $MODE $PATH"
 else
  echo "Fail: chmod $MODE $PATH"
  exit 1
 fi
}


echo This 01 script performs initial tasks

$SUDO date

$SUDO cp $RSNA_ROOT/Mirth\ Backup.xml ~rsna/Mirth_Backup.xml
$SUDO chown rsna:rsna ~rsna/Mirth_Backup.xml

local_chmod 700 $RSNA_ROOT/monitor-scripts/edgeserver_monitor.sh
local_chmod 600 $RSNA_ROOT/conf/database.properties
local_chmod 600 $RSNA_ROOT/torquebox-3.2.0/jboss/standalone/configuration/standalone.xml
local_chmod 600 $RSNA_ROOT/Mirth\*Backup.xml
local_chmod 600 $MIRTH/conf/mirth.properties
local_chmod 700 $RSNA_ROOT/torquebox-3.2.0/jboss/standalone/configuration/standalone_xml_history
local_chmod 700 $RSNA_ROOT/scripts



$SUDO sed -i -e 's-mirthconnect/mirth.properties-mirthconnect/conf/mirth.properties-g' $RSNA_ROOT/monitor-scripts/edgeserver_monitor.sh
if [[ $? -eq 0 ]]; then
 echo "Change mirth.properties path in: /monitor-scripts/edgeserver_monitor.sh"
else
 echo "Fail: Change mirth.properties path in: /monitor-scripts/edgeserver_monitor.sh"
 exit 1
fi

$SUDO psql -U postgres postgres << EOF
ALTER USER postgres WITH PASSWORD 'N3K647A';
EOF

$SUDO sed -i -e 's-  trust-  md5-g' /data/pg_hba.conf
if [[ $? -eq 0 ]]; then
 echo "Change database access trust/md5 in /data/ph_hba.conf"
else
 echo "Fail: Change database access trust/md5 in /data/ph_hba.conf"
 exit 1
fi

echo ""
$SUDO ls -ld \
	$RSNA_ROOT/monitor-scripts/edgeserver_monitor.sh	\
	$RSNA_ROOT/conf/database.properties	\
	$RSNA_ROOT/torquebox-3.2.0/jboss/standalone/configuration/standalone.xml	\
	$RSNA_ROOT/Mirth\ Backup.xml	\
	$MIRTH/conf/mirth.properties	\
	$RSNA_ROOT/torquebox-3.2.0/jboss/standalone/configuration/standalone_xml_history	\
	$RSNA_ROOT/scripts	\
	~rsna/Mirth_Backup.xml
