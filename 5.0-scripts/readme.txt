2018.03.16	moore.stephen.m@wustl.edu

--------------------------------------------------------------------------------
The scripts in this folder are intended to update edge-server files from the
5.0-t1 Maryland release to the final 5.0 product release.
As root, the user should execute the script master_script.sh.

The script master_script.sh takes one argument. This is the path to a folder
that contains another master_script.sh that will install large files that
have changed. These files are too large to store in our git repository.

The master_script.sh file in this folder invokes these scripts (in order):
stop_all_but_postgres.sh      Stops the existing edge-server services
01_file_protection.sh         Changes file protection on a set of files
02_configuration_content.sh   Changes content of some configuration files
03_postgres_password.sh       Changes value of the password used for postgres user account
04_disable_ctp.sh             Disables CTP software. Image submission protocol was changed.
05_cleanup.sh                 Cleans up some of the files that were touched during upgrade

When this is done, there is one more step this is helpful. You can reclaim disk
space that was used for files and then released by writing 0's over that space.
The method we use is:
Make sure all extra VM disks are unmounted and no longer tied to the VM
./stop_services.sh
dd if=/dev/zero of=~rsna/zero  (this will fill up the disk and will eventually exit)
rm ~rsna/zero

Use google to 
stop_services.sh
