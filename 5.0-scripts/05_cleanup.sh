#!/bin/sh
# Script to cleanup the VM before release

SUDO=/usr/bin/sudo
MIRTH=/usr/local/mirthconnect

sudo ~root/cleanup-short.sh

sudo echo "" > ~root/.bash_history
sudo echo "" > ~rsna/.bash_history
sudo ls -l  ~root/.bash_history ~rsna/.bash_history
