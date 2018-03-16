#!/bin/sh
# This script changes the file protections on the CTP start script
# so that it is no longer executable. This means that CTP will not
# start when the system boots.

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


echo This 01 script changes file permissions on the CTP startup script to disable it

$SUDO date

local_chmod 644 /etc/init.d/ctpService

ls -l /etc/init.d/ctpService
