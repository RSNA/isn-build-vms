#!/bin/sh

if [ ! -d other_files ]
then
 echo The folder other_files needs to exist here. It is not part of the git repository
 exit 1
fi

if [ ! -d torquebox-3.2.0 ]
then
 echo The folder torquebox-3.2.0 needs to exist here. It is not part of the git repository
 exit 1
fi

sudo systemctl stop edge-server
sudo systemctl stop mirthconnect
sudo systemctl stop torquebox

export BASE=/usr/local/edge-server
sudo cp -rp torquebox-3.2.0 $BASE
sudo chown -R edge:edge $BASE/torquebox-3.2.0
sudo mkdir /usr/local/deprecated
sudo chown edge:edge /usr/local/deprecated
sudo mv $BASE/torquebox-3.1.2 /usr/local/deprecated
sudo mv $BASE/torquebox-3.1.2.zip /usr/local/deprecated

sudo touch $BASE/core-3.2.0-t1.jar $BASE/prep-content-3.2.0-t1.jar $BASE/transfer-content-3.2.0-t1.jar
sudo rm    $BASE/core-3.2.0-t1.jar $BASE/prep-content-3.2.0-t1.jar $BASE/transfer-content-3.2.0-t1.jar

cd other_files
sudo ./file-install.csh
cd ..

export TORQUEBOX_SERVICE=/etc/systemd/system/torquebox.service
sudo cp torquebox.service $TORQUEBOX_SERVICE
sudo chown root:root      $TORQUEBOX_SERVICE
sudo chmod 644            $TORQUEBOX_SERVICE
ls -l $TORQUEBOX_SERVICE
