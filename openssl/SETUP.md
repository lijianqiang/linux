# openssl安装使用


## 1.源码安装
#### 下载  
> 官网地址 https://www.openssl.org/source  

#### 移除老版本  
    mv /usr/bin/openssl /usr/bin/openssl.old  
    mv /usr/include/openssl /usr/include/openssl.old

#### 编译  
    tar -zxvf openssl-1.1.0f.tar.gz  
    cd openssl-1.1.0f  
    ./config shared zlib  --prefix=/data/program/openssl  
>shared  

    make  
    make install  

#### 路径链接  

在/etc/profile的最后一行，添加
> export OPENSSL=/data/program/openssl  
  export PATH=$OPENSSL/bin:$PATH

    source /etc/profile


添加openssl库的软链接  

    ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl  
    ln -s /usr/local/openssl/include/openssl /usr/include/openssl  
    ln -sf /usr/local/openssl/lib/libcrypto.so.1.0.0 /lib/libcrypto.so.6  
    echo "/usr/local/openssl/lib" >>/etc/ld.so.conf  
    ldconfig -v  

#### 测试  

查看路径  

    which openssl  

查看版本  

    openssl version

测试是否正常工作  

    openssl
    openssl> version -a


## 2.使用
