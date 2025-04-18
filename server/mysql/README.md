# mysql的配置
- binary-setup 二进制文件配置
- master-slave 主从配置
- cluster 集群配置

## utf8mb4
https://blog.csdn.net/dgqvhtlwq472235338/article/details/101415815

修改mysql配置文件my.cnf（windows为my.ini）   
my.cnf一般在etc/mysql/my.cnf位置。找到后请在以下三部分里添加如下内容：

```
[client] 
default-character-set = utf8mb4 
[mysql] 
default-character-set = utf8mb4 
[mysqld] 
character-set-client-handshake = FALSE 
character-set-server = utf8mb4 
collation-server = utf8mb4_unicode_ci 
init_connect='SET NAMES utf8mb4'
```

重启数据库，检查变量
```
SHOW VARIABLES WHERE Variable_name LIKE 'character_set_%' OR Variable_name LIKE 'collation%';
```

## 跨机器访问

```
mysql -u root -p   登录数据库


use mysql; 选择基础信息数据库

select  User,authentication_string,Host from user 		查询数据库用户，在这里正常来说，应该都localhost

v7:
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'permit';

v8:
CREATE USER 'root'@'%' IDENTIFIED BY 'permit';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

新增一个root用户，所有地址（%）的都可以访问，并且密码为`permit` 。这里可以根据你的情况酌情修改

```
flush privileges;  		清除缓存，重新加载权限
```

一般来讲如果是旧版的mysql，以上的操作，就已经让数据库可以外部访问了。但是很遗憾，在mysql5.7中，上面还不足够。
 你需要修改       
 
 /etc/mysql/mysql.conf.d/mysqld.cnf 文件。将其中的
 
 bind-address 改成本机内网地址。然后重启数据库，搞定
