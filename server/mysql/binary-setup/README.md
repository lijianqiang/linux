# setup with a generic binary distribution


### 说明
- basedir=/app/mysql
- datadir=/app/mysql/data
- user = mysql
- group = mysql  

> 新建组和用户简单配制

### 解压和路径
  shell>$ pwd  
  shell>: /app/  
  shell>$ ls  
  shell>: mysql-5.7.16-linux-glibc2.5-x86_64.tar.gz  
  shell>$ tar -zxvf mysql-5.7.16-linux-glibc2.5-x86_64.tar.gz  
  shell>$ mv mysql-5.7.16-linux-glibc2.5-x86_64 mysql  
  shell>$ cd mysql  
  shell>$ pwd  
  shell>: /app/mysql/  
  shell>$ mkdir data  
  shell>$ ls  
  shell>: bin/  COPYING  docs/  include/  lib/  man/  README  share/  support-files/  data/  

### 新建用户和组
shell>$ groupadd mysql
shell>$ useradd -r -g mysql -s /bin/false mysql

### 更改目录权限
shell>$ cd /app/mysql/
shell>$ ls
	drwxr-xr-x 10 root root   4096 Nov  8 11:17 .
	drwxr-xr-x  3 root root   4096 Nov  8 11:17 ..
	drwxr-xr-x  2 root root   4096 Nov  8 11:13 bin
	-rw-r--r--  1 7161 31415 17987 Sep 29 01:02 COPYING
	drwxr-xr-x  2 root root   4096 Nov  8 11:17 data
	drwxr-xr-x  2 root root   4096 Nov  8 11:13 docs
	drwxr-xr-x  3 root root   4096 Nov  8 11:13 include
	drwxr-xr-x  5 root root   4096 Nov  8 11:13 lib
	drwxr-xr-x  4 root root   4096 Nov  8 11:13 man
	-rw-r--r--  1 7161 31415  2478 Sep 29 01:02 README
	drwxr-xr-x 28 root root   4096 Nov  8 11:13 share
	drwxr-xr-x  2 root root   4096 Nov  8 11:13 support-files
shell>$ chmod 750 data
shell>$ chown -R mysql .
shell>$ chgrp -R mysql .
shell>$ ls
	drwxr-xr-x 10 mysql mysql  4096 Nov  8 11:17 .
	drwxr-xr-x  3 root  root   4096 Nov  8 11:17 ..
	drwxr-xr-x  2 mysql mysql  4096 Nov  8 11:13 bin
	-rw-r--r--  1 mysql mysql 17987 Sep 29 01:02 COPYING
	drwxr-x---  2 mysql mysql  4096 Nov  8 11:17 data
	drwxr-xr-x  2 mysql mysql  4096 Nov  8 11:13 docs
	drwxr-xr-x  3 mysql mysql  4096 Nov  8 11:13 include
	drwxr-xr-x  5 mysql mysql  4096 Nov  8 11:13 lib
	drwxr-xr-x  4 mysql mysql  4096 Nov  8 11:13 man
	-rw-r--r--  1 mysql mysql  2478 Sep 29 01:02 README
	drwxr-xr-x 28 mysql mysql  4096 Nov  8 11:13 share
	drwxr-xr-x  2 mysql mysql  4096 Nov  8 11:13 support-files
  
### 开始配置
  
shell>$ bin/mysqld --initialize --user=mysql --basedir=/app/mysql --datadir=/app/mysql/data  
shell>: ...  +g!eckSb0hj/
shell>: [Note] A temporary password is generated for root@localhost: p17p>qrr5Msp  
> 此处需要注意记录生成的临时密码，如上文：p17p>qrr5Msp    
  
  shell>$ bin/mysql_ssl_rsa_setup  --datadir=/app/mysql/data  
  shell>: ...  
> 可以忽略  

### 启动
  
  shell>$ bin/mysqld_safe --user=mysql &  
  shell>: 2016-10-26T09:02:49.502483Z mysqld_safe Starting mysqld daemon with databases from /app/mysql/data  
  shell>$ ps -ef | grep mysql  
  
### 登陆修改root密码  
  
  shell>$ bin/mysql -uroot -p  
  Enter password: p17p>qrr5Msp  
  
  mysql> set password=password('permit');  
  mysql> show databases;  
> 完成  
  
### 其他 
> 添加系统路径  
shell>$ vim /etc/profile  
  	添加：  
	export PATH=/app/mysql/bin:$PATH  
 
shell>$ source /etc/profile  
  
### 开机启动
  shell>$ cp /app/mysql/support-files/my-default.cnf /etc/my.cnf
  shell>$ vim /etc/my.cnf  

- - -
         my.cnf
  
  shell>$ cp /app/mysql/support-files/mysql.server /etc/init.d/mysqld
  shell>$ vim /etc/init.d/mysqld  

- - -
          basedir=/app/mysql
          datadir=/app/mysql/data
  
##### ubuntu 14.04
  shell>$ update-rc.d mysqld defaults

##### linux
  chmod 755 /etc/init.d/mysqld  
  chkconfig --add mysqld  
  chkconfig --level 345 mysqld on  

##### finished
  
### ref
    http://www.jb51.net/article/87160.htm
    http://dev.mysql.com/doc/refman/8.0/en/binary-installation.html
  
  
    
