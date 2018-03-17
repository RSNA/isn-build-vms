#!/bin/sh
# Script to update the 5.0-t1 virtual machine to the release version

SUDO=/usr/bin/sudo
MIRTH=/usr/local/mirthconnect

local_chmod()
{
 MODE=$1
 PATH=$2
 shift; shift;

 /bin/chmod $MODE $PATH
 if [[ $? -eq 0 ]]; then
  echo "chmod $MODE $PATH"
 else
  echo "Fail: chmod $MODE $PATH"
  exit 1
 fi
}


echo This 01 script changes file permissions and makes a copy of Mirth_Backup.xml

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
