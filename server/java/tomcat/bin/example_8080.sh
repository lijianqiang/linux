#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_101
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=./:$JAVA_HOME/lib:$JRE_HOME/lib
export CATALINA_OUT=/home/lijianqiang/logs/tomcat/example_8081.out
export LOGGING_CONFIG="-Djava.util.logging.config.file=../conf/example_8080.properties"
export SERVER_CONF="-config conf/example_8080.xml"

JAVA_OPTS='-server -Xrs -Xmx512m -Xms126m -Xmn512m -Xss256k -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:LargePageSizeInBytes=128m -XX:+UseFastAccessorMethods -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=70 -XX:SurvivorRatio=8 -Xverify:none -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false'

cd `dirname $0` #进入这个目录(切换当前工作目录)
. ./execute.sh
