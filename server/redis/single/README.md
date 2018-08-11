# redis单实例

### 解压安装
    mv redis-xxx.tar.gz /data/program  
    tar -zxvf redis-xxx.tar.gz  
    cd redis-xxx
    make    
    make install  // 安装到默认路径 /usr/local/bin  
    
    make PREFIX=/data/program/redis install  // 指定安装路径
    
### 启动
    redis/bin/redis-server redis/conf/redis.conf   // 从redis-xxx里拷贝一份，按实际修改配置

### 其他
    编辑conf文件  
    将daemonize属性改为yes（表明需要在后台运行）  
