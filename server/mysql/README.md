# mysql的配置
- binary-setup 二进制文件配置
- master-slave 主从配置
- cluster 集群配置


## 跨机器访问

```
mysql -u root -p   登录数据库

use mysql； 选择基础信息数据库

select  User,authentication_string,Host from user 		查询数据库用户，在这里正常来说，应该都localhost


GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'permit'   
```

新增一个root用户，所有地址（%）的都可以访问，并且密码为123456 。这里可以根据你的情况酌情修改

```
flush privileges;  		清除缓存，重新加载权限
```

一般来讲如果是旧版的mysql，以上的操作，就已经让数据库可以外部访问了。但是很遗憾，在mysql5.7中，上面还不足够。
 你需要修改       
 
 /etc/mysql/mysql.conf.d/mysqld.cnf 文件。将其中的
 
 bind-address 注释掉。然后重启数据库，搞定
