#!/bin/bash
cd /data/redis_cluster/
rm -rf *.aof
rm -rf *.rdb
find ./ -name "nodes-700*" -exec rm -rf "{}" \;
find ./ -name "redis.pid" -exec rm -rf "{}" \;
echo 'starting redis-cluster ...'
cd /data/redis_cluster/
redis-3.2.4/src/redis-server /data/redis_cluster/nodes/7000/redis.conf
redis-3.2.4/src/redis-server /data/redis_cluster/nodes/7001/redis.conf
redis-3.2.4/src/redis-server /data/redis_cluster/nodes/7002/redis.conf
redis-3.2.4/src/redis-server /data/redis_cluster/nodes/7003/redis.conf
redis-3.2.4/src/redis-server /data/redis_cluster/nodes/7004/redis.conf
redis-3.2.4/src/redis-server /data/redis_cluster/nodes/7005/redis.conf
ps -ef | grep redis-server
redis-3.2.4/src/redis-trib.rb create --replicas 1 120.77.16.193:7000 120.77.16.193:7001 120.77.16.193:7002 120.77.16.193:7003 120.77.16.193:7004 120.77.16.193:7005
