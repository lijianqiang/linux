# openssl安装使用


## 1.源码安装
#### 下载  
> 官网地址 https://www.openssl.org/source  

#### 移除老版本  
    mv /usr/bin/openssl /usr/bin/openssl.old  
    mv /usr/include/openssl /usr/include/openssl.old
    mv /etc/ssl /etc/ssl.old

#### 编译  
    tar -zxvf openssl-1.1.0f.tar.gz  
    cd openssl-1.1.0f  
    ./config shared zlib --prefix=/data/program/openssl  
>shared 的作用是生成动态链接库

    make  
    make install  

#### 路径链接  

在/etc/profile的最后一行，添加
> export OPENSSL=/data/program/openssl  
  export PATH=${PATH}:${OPENSSL}/bin

    source /etc/profile


添加openssl库的软链接  

    ln -s /data/program/openssl/bin/openssl /usr/bin/openssl  
    ln -s /data/program/openssl/include/openssl /usr/include/openssl     
    echo "/data/program/openssl/lib" >>/etc/ld.so.conf  
    ldconfig -v  

> 可选： ln -sf /data/program/openssl/lib/libcrypto.so.1.0.0 /lib/libcrypto.so.6

#### 测试  

重启系统

    reboot

> 是否必须

查看路径  

    which openssl  

查看版本  

    openssl version

测试是否正常工作  

    openssl
    openssl> version -a


## 2.使用
