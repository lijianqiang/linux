#!/bin/sh
CONF=/data/program/logstash/logconf/logstash-springboot.conf 

echo "conf is: "$CONF

/data/program/logstash/bin/logstash  -f $CONF
