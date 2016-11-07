#Zookeeper单实例配置
 
zoo_sample.cfg


> `# The number of milliseconds of each tick`
tickTime=2000
`# The number of ticks that the initial` 
`# synchronization phase can take`
initLimit=10`
`# The number of ticks that can pass between`  
`# sending a request and getting an acknowledgement`
syncLimit=5`
`# the directory where the snapshot is stored.`
`# do not use /tmp for storage, /tmp here is just `
`# example sakes.`
dataDir=/data/zookeeper
dataLogDir=/data/logs/zookeeper
`# the port at which the clients will connect`
clientPort=2181
`#`
`# Be sure to read the maintenance section of the `
`# administrator guide before turning on autopurge.`
`#
`# http://zookeeper.apache.org/doc/current/zookeeperAdmin.html#sc_maintenance`
`#`
`# The number of snapshots to retain in dataDir`
`#autopurge.snapRetainCount=3`
`# Purge task interval in hours`
`# Set to "0" to disable auto purge feature`
> `#autopurge.purgeInterval=1`
 

tickTime：这个时间是作为 Zookeeper 服务器之间或客户端与服务器之间维持心跳的时间间隔，也就是每个 tickTime 时间就会发送一个心跳。  
dataDir：顾名思义就是 Zookeeper 保存数据的目录，默认情况下，Zookeeper 将写数据的日志文件也保存在这个目录里。  
dataLogDir：顾名思义就是 Zookeeper 保存日志文件的目录  
clientPort：这个端口就是客户端连接 Zookeeper 服务器的端口，Zookeeper 会监听这个端口，接受客户端的访问请求。  

> 当这些配置项配置好后，就可以启动 Zookeeper了，
- 1.进入zookeeper的bin目录，执行sh zkServer.sh start进行启动zookeeper
- 2.查看状态   进入bin目录，执行sh zkServer.sh status
- 3.停止    进入bin目录，执行sh zkServer.sh stop  

> 启动后要检查 Zookeeper 是否已经在服务，可以通过 netstat – ano 命令查看是否有你配置的 clientPort 端口号在监听服务。
