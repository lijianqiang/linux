# mongodb 安装

单个实例

### Install MongoDB
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-linux/


### 1.下载解压
  mv mongodb-3.x.tar.gz /data/program  
  tar -zxvf mongodb-3.x  
  pwd  


### 2.配置
目录创建
  
  mkdir -p /data/mongo/27017/data  
  mkdir -p /data/mongo/27017/log
  touch /data/mongo/27017/log/mongodb.log
  

启动参数

  mkdir conf && cd conf
  vim mongo-27017.conf

> port=27017
> dbpath=/data/mongo/27017/data
> logpath=/data/mongo/27017/log/mongodb.log
> logappend=true
> fork=true
> maxConns=20000
 


### 3.加路径


### 4.启动

