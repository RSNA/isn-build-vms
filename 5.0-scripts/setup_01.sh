#!/bin/sh
# Script to update the 5.0-t1 virtual machine to the release version
# This particular script only updates the password for the postgres account.

$SUDO psql -U postgres postgres << EOF
ALTER USER postgres WITH PASSWORD 'N3K647A';
EOF

