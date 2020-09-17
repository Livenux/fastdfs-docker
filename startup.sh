#!/bin/bash

echo "\nChange FDFS Storage configure file\n"
set -x
sed -i "s/^#tracker_server.*$/${TRACKER_SERVER}/" /etc/fdfs/storage.conf
sed -i "s/^#tracker_server.*$/${TRACKER_SERVER}/" /etc/fdfs/client.conf
sed -i "s/http.domain_name.*$/http.domain_name=$WEB_DOMAIN/" /etc/fdfs/storage.conf

mkdir -p /var/fdfs/store0
chown fdfs:fdfs /var/fdfs -R

echo "\nStart FDFS storage Server.\n"
/usr/bin/fdfs_storaged /etc/fdfs/storage.conf
sleep 5
tail -f  /var/fdfs/logs/storaged.log
