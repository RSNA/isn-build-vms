#!/bin/sh
# Script to update the 5.0-t1 virtual machine to the release version
# This script invokes other scripts to perform the actual work.
# It takes one argument which is a folder that contains the files
# to be installed. Those files are large. We do not want to store them
# in our git repository.

no_folder() 
{
 echo Folder $1 does not exist
 exit 1
}

no_master_script() 
{
 echo The file master_script.sh does not exist in folder $1
 exit 1
}

usage_error()
{
 echo 'This script requires one argument'
 echo ' + Pointer to folder with installation files'
 exit
}

[ -z $1 ] && usage_error

[ ! -d $1 ] && no_folder $1

[ ! -e $1/master_script.sh ] && no_master_script $1

echo go
chmod +x *.sh
./stop_all_but_postgres.sh
./01_file_protection.sh
./02_configuration_content.sh
./03_postgres_password.sh
./04_disable_ctp.sh

pushd $1
./master_script.sh
popd
./05_cleanup.sh

echo 'You might want to zero out space in the file system'
echo 'Review the readme file in this folder'
