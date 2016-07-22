#!/bin/sh
DUMP=/usr/bin/mysqldump 
OUT_DIR=/root/galileo_intentplay_backup/mysql_data
LINUX_USER=root
DB_NAME=apollodb
DB_USER=apollouser2016
DB_PASS=apollopassword2016
DAYS=1
rm $OUT_DIR/*
cd $OUT_DIR
DATE=`date +%Y%m%d%H%M`
OUT_SQL=$DATE.sql
TAR_SQL="mysqldata_bak_$DATE.tar.gz"
$DUMP -u$DB_USER -p$DB_PASS $DB_NAME --default-character-set=gbk --opt -Q -R --skip-lock-tables>$OUT_SQL
tar -czf $TAR_SQL ./$OUT_SQL
rm $OUT_SQL
chown $LINUX_USER:$LINUX_USER $OUT_DIR/$TAR_SQL;
