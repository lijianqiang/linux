# redis集群配置
本例一台机器上部6个节点。（2机各3节点，3机个2节点）

## 1.解压安装
    mv redis-xxx.tar.gz /data/program  
    tar -zxvf redis-xxx.tar.gz  
    cd redis-xxx
    make    
    make install  // 安装到默认路径 /usr/local/bin  
    
    make PREFIX=/data/program/redis install  // 指定安装路径

## 2.路径约定
    /data/program/redis  
    |------------------/bin
    |------------------/shell
    |------------------/conf
    |-----------------------/single
    |-----------------------/cluster
    |-------------------------------/7000
    |-------------------------------/7001

## 3.创建redis节点
> 单机6个节点，3主3从  

shell> cd /data/program/redis/conf/cluster/  
shell> ls   
: 7000/  7001/  7002/  7003/  7004/  7005/  redis-common.conf  

> 创建6个文件夹和一个公共配置文件  
  
   
shell> cd 7000/  
shell> ls  
: redis.conf  

> 依次执行下面语句  

shell> /data/program/redis/bin/redis-server /data/program/redis/cluster/7000/redis.conf  
shell> ps -ef | grep redis  

> root      5167     1  0 16:20 ?        00:00:03 /data/program/redis/bin/redis-server 120.77.16.193:7000 [cluster]             
> root      5179     1  0 16:21 ?        00:00:03 /data/program/redis/bin/redis-server 120.77.16.193:7001 [cluster]             
> root      5183     1  0 16:21 ?        00:00:03 /data/program/redis/bin/redis-server 120.77.16.193:7002 [cluster]             
> root      5187     1  0 16:21 ?        00:00:03 /data/program/redis/bin/redis-server 120.77.16.193:7003 [cluster]             
> root      5191     1  0 16:21 ?        00:00:03 /data/program/redis/bin/redis-server 120.77.16.193:7004 [cluster]             
> root      5195     1  0 16:21 ?        00:00:03 /data/program/redis/bin/redis-server 120.77.16.193:7005 [cluster]
   


## 4.创建集群
安装类库

> ubuntu

shell> apt-get install ruby  
shell> apt-get install rubygems-integration  
shell> gem install redis

> centos

shell> yum -y install ruby ruby-devel rubygems rpm-build  
shell> gem intsall redis  

shell> /data/program/redis/bin/redis-trib.rb create --replicas 1 120.77.16.193:7000 120.77.16.193:7001 120.77.16.193:7002  120.77.16.193:7003  120.77.16.193:7004  120.77.16.193:7005  
   
##### 说明：  
> redis-trib.rb来自原解压包redis-xxx/src  
> --replicas  1  表示 自动为每一个master节点分配一个slave节点  
> 上面有6个节点，程序会按照一定规则生成 3个master（主）3个slave(从)
> 运行中，提示Can I set the above configuration? (type 'yes' to accept): yes    
> 输入yes

##### ok
    
##### 检查  
shell> /data/program/redis/bin/redis-trib.rb check 120.77.16.193:7000  

##### 测试
shell> /data/program/redis/bin/redis-cli -c -h 120.77.16.193 -p 7000  
> 只有加了-c参数，才能开启redis cluster 模式



## 5. via 
http://www.linuxidc.com/Linux/2015-08/121845.htm  
http://www.cnblogs.com/tankaixiong/articles/4022646.html  
   
> 注意：common.conf里绑定了ip
   
   

