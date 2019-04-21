# hbase hadoop full distributed
## version
hadoop-2.8.5.tar.gz         
hbase-2.0.5-bin.tar.gz

## jdk
```
export JAVA_HOME=/data/program/jdk1.8
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
```

## hosts
```
172.16.119.4    hadoop001
172.16.119.5    hadoop002
172.16.119.6    hadoop003
```

## ssh
```
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

ssh-copy-id -i ~/.ssh/id_rsa.pub root@hadoop002
ssh-copy-id -i ~/.ssh/id_rsa.pub root@hadoop003
```
