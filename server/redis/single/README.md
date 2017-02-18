# 单机安装

### 解压安装
    mv redis-xxx.tar.gz /data/program  
    tar redis-xxx.tar.gz  
    cd redis-xxx
    make && make install

### 启动
    src/redis-server

### 其他
    编辑conf文件  
    将daemonize属性改为yes（表明需要在后台运行）  
