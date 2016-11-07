##1、去Zookeeper官网下载最新版本的Zookeeper.

[root@localhost zookeeper-cluster]# pwd  
/data/zookeeper-cluster  
[root@localhost zookeeper-cluster]# ls  
zookeeper-3.4.6.tar.gz  
[root@localhost zookeeper-cluster]#  
[root@localhost zookeeper-cluster]# tar -zxvf zookeeper-3.4.6.tar.gz  

###创建第一个集群节点
[root@localhost zookeeper-cluster]# mv zookeeper-3.4.6 zookeeper-3.4.6-node1  
[root@localhost zookeeper-cluster]# cd zookeeper-3.4.6-node1  
[root@localhost zookeeper-3.4.6-node1]# pwd  
/data/zookeeper-cluster/zookeeper-3.4.6-node1  

###创建数据存放路径
[root@localhost zookeeper-3.4.6-node1]# mkdir data  
[root@localhost zookeeper-3.4.6-node1]# cd ../  

###创建第二第三个集群节点
[root@localhost zookeeper-cluster]# cp zookeeper-3.4.6-node1 zookeeper-3.4.6-node2 -R  
[root@localhost zookeeper-cluster]# cp zookeeper-3.4.6-node1 zookeeper-3.4.6-node3 -R  
[root@localhost zookeeper-cluster]# ls  
zookeeper-3.4.6-node1  zookeeper-3.4.6-node2  zookeeper-3.4.6-node3  zookeeper-3.4.6.tar.gz  
[root@localhost zookeeper-cluster]# cd zookeeper-3.4.6-node1/conf/  
[root@localhost conf]# ls  
configuration.xsl  log4j.properties  zoo_sample.cfg  

###创建zoo.cfg文件
[root@localhost conf]# cp zoo_sample.cfg zoo.cfg

##2、配置zoo.cfg文件:

###zookeeper-3.4.6-node1的配置
tickTime=2000  
initLimit=10  
syncLimit=5  
clientPort=2181  
dataDir=/data/zookeeper-cluster/zookeeper-3.4.6-node1/data  
server.1=localhost:2887:3887  
server.2=localhost:2888:3888  
server.3=localhost:2889:3889  

###zookeeper-3.4.6-node2的配置
tickTime=2000  
initLimit=10  
syncLimit=5  
clientPort=2182  
dataDir=/data/zookeeper-cluster/zookeeper-3.4.6-node2/data  
server.1=localhost:2887:3887  
server.2=localhost:2888:3888  
server.3=localhost:2889:3889  

###zookeeper-3.4.6-node3的配置
tickTime=2000  
initLimit=10  
syncLimit=5  
clientPort=2183  
dataDir=/data/zookeeper-cluster/zookeeper-3.4.6-node3/data  
server.1=localhost:2887:3887  
server.2=localhost:2888:3888  
server.3=localhost:2889:3889  


##3、创建ServerID标识

除了修改zoo.cfg配置文件,集群模式下还要配置一个文件myid,  
这个文件在dataDir目录下,这个文件里面就有一个数据就是A的值,在上面配置文件中zoo.cfg中配置的dataDir路径中创建myid文件  

[root@localhost zookeeper-cluster]# cat /data/zookeeper-cluster/zookeeper-3.4.6-node1/data/myid1  
[root@localhost zookeeper-cluster]# cat /data/zookeeper-cluster/zookeeper-3.4.6-node2/data/myid2  
[root@localhost zookeeper-cluster]# cat /data/zookeeper-cluster/zookeeper-3.4.6-node3/data/myid3  

##4、启动zookeeper

[root@localhost zookeeper-cluster]# /data/zookeeper-cluster/zookeeper-3.4.6-node1/bin/zkServer.sh start  
JMX enabled by default  
Using config: /data/zookeeper-cluster/zookeeper-3.4.6-node1/bin/../conf/zoo.cfg  
Starting zookeeper ... STARTED  
[root@localhost zookeeper-cluster]# /data/zookeeper-cluster/zookeeper-3.4.6-node2/bin/zkServer.sh start  
JMX enabled by default  
Using config: /data/zookeeper-cluster/zookeeper-3.4.6-node2/bin/../conf/zoo.cfg  
Starting zookeeper ... STARTED  
[root@localhost zookeeper-cluster]# /data/zookeeper-cluster/zookeeper-3.4.6-node3/bin/zkServer.sh start  
JMX enabled by default  
Using config: /data/zookeeper-cluster/zookeeper-3.4.6-node3/bin/../conf/zoo.cfg  
Starting zookeeper ... STARTED  

##5、检测集群是否启动

[root@localhost zookeeper-cluster]# echo stat|nc localhost 2181  
[root@localhost zookeeper-cluster]# echo stat|nc localhost 2182  
[root@localhost zookeeper-cluster]# echo stat|nc localhost 2183  
###或者
[root@localhost zookeeper-cluster]# /data/zookeeper-cluster/zookeeper-3.4.6-node1/bin/zkCli.sh  
[root@localhost zookeeper-cluster]# /data/zookeeper-cluster/zookeeper-3.4.6-node2/bin/zkCli.sh  
[root@localhost zookeeper-cluster]# /data/zookeeper-cluster/zookeeper-3.4.6-node3/bin/zkCli.sh  



##参数说明:

tickTime=2000:  
tickTime这个时间是作为Zookeeper服务器之间或客户端与服务器之间维持心跳的时间间隔,也就是每个tickTime时间就会发送一个心跳:  

initLimit=10:  
initLimit这个配置项是用来配置Zookeeper接受客户端初始化连接时最长能忍受多少个心跳时间间隔数。
（这里所说的客户端不是用户连接Zookeeper服务器的客户端,而是Zookeeper服务器集群中连接到Leader的Follower 服务器）
当已经超过10个心跳的时间（也就是tickTime）长度后 Zookeeper 服务器还没有收到客户端的返回信息,那么表明这个客户端连接失败。
总的时间长度就是 10*2000=20 秒；

syncLimit=5:
syncLimit这个配置项标识Leader与Follower之间发送消息,请求和应答时间长度,最长不能超过多少个tickTime的时间长度,总的时间长度就是5*2000=10秒；

dataDir=/data/zookeeper-cluster/zookeeper-3.4.6-node1/data
dataDir顾名思义就是Zookeeper保存数据的目录,默认情况下Zookeeper将写数据的日志文件也保存在这个目录里；

clientPort=2181
clientPort这个端口就是客户端连接Zookeeper服务器的端口,Zookeeper会监听这个端口接受客户端的访问请求；

server.1=localhost:2887:3887
server.2=localhost:2888:3888
server.3=localhost:2889:3889
server.A=B：C：D：
A是一个数字,表示这个是第几号服务器,B是这个服务器的ip地址
C第一个端口用来集群成员的信息交换,表示的是这个服务器与集群中的Leader服务器交换信息的端口
D是在leader挂掉时专门用来进行选举leader所用


伪集群部署注意事项:

在一台机器上部署了3个server；需要注意的是clientPort这个端口如果在1台机器上部署多个server,那么每台机器都要不同的clientPort.

比如 server.1是2181,server.2是2182,server.3是2183

最后几行唯一需要注意的地方就是

server.X 这个数字就是对应 data/myid中的数字。
你在3个server的myid文件中分别写入了1,2,3,那么每个server中的zoo.cfg都配 server.1,server.2,server.3就OK了


via http://www.linuxidc.com/Linux/2015-02/114230.htm
