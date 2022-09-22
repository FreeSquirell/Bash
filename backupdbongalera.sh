#!/bin/bash

DATA=`date +%Y-%m-%d-%H`
sudo /usr/bin/mysql -e "set global wsrep_desync="ON""
sudo mkdir -p /mnt/backup/$DATA
sudo xtrabackup --backup --databases "sitemanager" --target-dir=/mnt/backup/$DATA/sitemanager
sudo xtrabackup --prepare --export --databases "sitemanager" --target-dir=/mnt/backup/$DATA/sitemanager_uteam
sudo tar -czvf /mnt/backup/$DATA/sitemanager_uteam.tar.gz -C /mnt/backup/$DATA sitemanager
sudo rm -rf /mnt/backup/$DATA/sitemanager
sudo /usr/bin/mysql -e "set global wsrep_desync="OFF""
