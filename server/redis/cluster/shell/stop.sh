#!/bin/bash
killall redis-server
cd /data/redis_cluster/
rm -rf *.aof
rm -rf *.rdb
find ./ -name "nodes-700*" -exec rm -rf "{}" \;
find ./ -name "redis.pid" -exec rm -rf "{}" \;
echo 'redis-cluster stoped ...'
