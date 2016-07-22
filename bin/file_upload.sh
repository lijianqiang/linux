#!/bin/sh
LINUX_USER=root
DES_HOST=www.intentplay.com
DES_DIR=/root/company_file/galileo_intentplay_com
SRC_DIR=/root/galileo_intentplay_backup
TAG_DIR=/record
IMAGE_DIR=/image_data
MYSQL_DIR=/mysql_data
DATE=`date +%Y%m%d%H%M`
SYNC_TAG="sync_galileo_intentplay_$DATE"
touch $SRC_DIR$TAG_DIR/$SYNC_TAG
scp $SRC_DIR/$SYNC_TAG $DES_HOST:$DES_DIR
scp $SRC_DIR/$IMAGE_DIR/* $DES_HOST:$DES_DIR
scp $SRC_DIR/$MYSQL_DIR/* $DES_HOST:$DES_DIR
