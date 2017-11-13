#!/bin/sh
# Script to stop Edge Server services so we can change files

SUDO=/usr/bin/sudo
MIRTH=/usr/local/mirthconnect

$SUDO ls /tmp

$SUDO systemctl start postgresql
sleep 5
$SUDO systemctl start torquebox
$SUDO systemctl start edge-server
$SUDO systemctl start mirthconnect
