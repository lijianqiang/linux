#!/bin/bash
cd /data/program/redis/
rm -rf *.aof
rm -rf *.rdb
find ./ -name "nodes-700*" -exec rm -rf "{}" \;
find ./ -name "redis.pid" -exec rm -rf "{}" \;

echo 'starting redis-cluster ...'

REDIS=/data/program/redis/bin/redis-server

if [ ! -e $REDIS ]; then
    echo "redis-server not found! Path:"$REDIS
    exit 1
fi


$REDIS /data/program/redis/conf/cluster/7000/redis.conf
$REDIS /data/program/redis/conf/cluster/7001/redis.conf
$REDIS /data/program/redis/conf/cluster/7002/redis.conf

ps -ef | grep redis-server

# Warn: redis-trib.rb is in redis-xx/src
IP=192.168.1.5
/data/program/redis/bin/redis-trib.rb create $IP:7000 $IP:7001 $IP:7002