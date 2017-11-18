#!/bin/sh
# Script to stop Edge Server services so we can change files
# This script leaves postgres running

SUDO=/usr/bin/sudo
MIRTH=/usr/local/mirthconnect

$SUDO ls /tmp

$SUDO systemctl stop torquebox
$SUDO systemctl stop edge-server
$SUDO systemctl stop mirthconnect
