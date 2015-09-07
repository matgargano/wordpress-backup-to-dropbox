#!/bin/bash

SITE='statenweb.com'


cd /home/ubuntu/$SITE/public/current/web

mkdir -p /home/ubuntu/$SITE/backups/`date +%Y%m%d`

wp db export /home/ubuntu/$SITE/backups/`date +%Y%m%d`/`date +%Y%m%d`_database.sql --add-drop-table


tar -zcf /home/ubuntu/$SITE/backups/`date +%Y%m%d`/`date +%Y%m%d`_uploads.tar.gz /home/ubuntu/statenweb.com/public/shared/web/uploads

tar -zcf /home/ubuntu/$SITE/backups/$SITE.`date +%Y%m%d`.tar.gz /home/ubuntu/$SITE/backups/`date +%Y%m%d`

rm -rf /home/ubuntu/$SITE/backups/`date +%Y%m%d`/

cd /home/ubuntu/$SITE/backups/Dropbox-Uploader

./dropbox_uploader.sh upload /home/ubuntu/$SITE/backups/$SITE.`date +%Y%m%d`.tar.gz backups/$SITE/$SITE.`date +%Y%m%d`.tar.gz



rm /home/ubuntu/$SITE/backups/$SITE.`date +%Y%m%d`.tar.gz
