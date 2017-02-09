#!/bin/bash
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_101
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin

cd /opt/eclipse
./eclipse
