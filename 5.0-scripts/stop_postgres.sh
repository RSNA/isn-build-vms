#!/bin/sh
# Script to stop Edge Server services so we can change files

SUDO=/usr/bin/sudo

$SUDO ls /tmp

$SUDO systemctl stop postgresql
