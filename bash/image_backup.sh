#!/bin/sh
OUT_DIR=/root/galileo_intentplay_backup/image_data
SOURCE_DIR=/opt/apache-tomcat-8.0.30/webapps/ROOT/static/upload
LINUX_USER=root
DAYS=1
rm $OUT_DIR/*
cd $OUT_DIR
DATE=`date +%Y%m%d%H%M`
TAR_BAK="galileo_intentplay_img_$DATE.tar.gz"
IMG_DIR="img_temp_$DATE";
mkdir $IMG_DIR;
cp -R $SOURCE_DIR/* $IMG_DIR/
tar -czf $TAR_BAK $IMG_DIR
rm -r $IMG_DIR
chown $LINUX_USER:$LINUX_USER $OUT_DIR/$TAR_BAK;
