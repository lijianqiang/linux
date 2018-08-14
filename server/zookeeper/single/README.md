# Zookeeper单实例配置

zoo_sample.cfg

    tickTime=2000  
    initLimit=10  
    syncLimit=5  
    dataDir=/data/zookeeper  
    dataLogDir=/data/logs/zookeeper  
    clientPort=2181  



> tickTime：这个时间是作为 Zookeeper 服务器之间或客户端与服务器之间维持心跳的时间间隔，也就是每个 tickTime 时间就会发送一个心跳。  
> dataDir：顾名思义就是 Zookeeper 保存数据的目录，默认情况下，Zookeeper 将写数据的日志文件也保存在这个目录里。  
>dataLogDir：顾名思义就是 Zookeeper 保存日志文件的目录  
clientPort：这个端口就是客户端连接 Zookeeper 服务器的端口，Zookeeper 会监听这个端口，接受客户端的访问请求。  

当这些配置项配置好后，就可以启动 Zookeeper了，进入zookeeper的bin目录  

启动zookeeper

    zkServer.sh start


查看状态   

    zkServer.sh status

停止    

    zkServer.sh stop  

启动后要检查 Zookeeper 是否已经在服务，可以通过

    netstat – ano

命令查看是否有你配置的 clientPort 端口号在监听服务。
