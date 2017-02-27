# etcd安装及配置
使用实际ip和端口


### 1、安装
Etcd的安装非常简单，只需下载最新的稳定包下来，然后解压即安装成功.

	shell> tar -vzxf /data/etcd-v3.0.15-linux-amd64.tar.gz -C /data/program/

解压成功后目录里就可以看到etcd和etcdctl2个脚本


### 2、启动etcd
路径

	dataDir = /data/program/etcd-v3.0.15-linux-amd64, 安装机器内网ip：192.168.198.117

启动

	shell> nohup ./etcd -listen-client-urls http://192.168.198.117:2377 -advertise-client-urls http://192.168.198.117:2377 &

> -listen-client-urls 监听的用于客户端通信的url,同样可以监听多个。  
> -advertise-client-urls  建议使用的客户端通信url,该值用于etcd代理或etcd成员与etcd节点通信。  

启动成功后使用

	shell> ./etcdctl -endpoints http://192.168.198.117:2377 set hello world  
	shell> ./etcdctl -endpoints http://192.168.198.117:2377 get hello  

> 能否正常的set和get.

### 3、设置etcd的访问控制

开启访问控制必须先添加root用户,添加时设置密码

	shell> ./etcdctl -endpoints http://192.168.198.117:2377 user add root

开启权限认证

	shell> ./etcdctl -endpoints http://192.168.198.117:2377 auth enable

添加账号

	shell> ./etcdctl -endpoints http://192.168.198.117:2377 --username root:ztemt123 user add nubia

查看账号是否添加成功

	shell> ./etcdctl -endpoints http://192.168.198.117:2377 --username root:ztemt123 user list

添加角色

	shell> ./etcdctl -endpoints http://192.168.198.117:2377 --username root:ztemt123 role add nubia-role

给角色添加权限

	shell> ./etcdctl -endpoints http://192.168.198.117:2377 --username root:ztemt123 role grant -rw -path=/* nubia-role   

> /* 即赋于etcd下所有的读写权限

删除guest角色，防止所有用户都有权限

	shell> ./etcdctl -endpoints http://192.168.198.117:2377 --username root:ztemt123 role remove guest

将用户添加到角色中

	shell> ./etcdctl -endpoints http://192.168.198.117:2377 --username root:ztemt123 user grant -roles nubia-role nubia

使用新添加的用户操作

	shell> ./etcdctl -endpoints http://192.168.198.117:2377 --username nubia:ztemt123 set hello world
