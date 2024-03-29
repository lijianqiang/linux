# rabbitmq

## erlang

在系统中加入 erlang apt 仓库。

```
$ wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
$ sudo dpkg -i erlang-solutions_1.0_all.deb
```

更新软件列表

```
$ sudo apt-get update
```

最后安装Erlang

```
$ sudo apt-get install erlang
```

可以安装完整的erlang， 它包括Erlang/OTP平台及其所有应用程序。
```
可以安装完整的erlang， 它包括Erlang/OTP平台及其所有应用程序。
```

https://www.cnblogs.com/hshy/p/11096827.html

## rabbitmq

直接用官网安装脚本

https://www.rabbitmq.com/install-debian.html

https://www.rabbitmq.com/install-debian.html#apt-quick-start-cloudsmith


## web插件

启用web管理插件

```
$ sudo rabbitmq-plugins enable rabbitmq_management
```

重启rabbitmq服务

```
$ sudo systemctl restart rabbitmq-server
```

重启后访问

http://localhost:15672

默认用户名密码：guest/guest

## 常用命令

rabbitmq 状态

```
$ rabbitmqctl status
```

关闭 rabbitmq （但是没有关闭节点）

```
$ rabbitmqctl stop_app
```

启动 rabbitmq

```
$ rabbitmqctl start_app
```

关闭 rabbitmq 以及节点

```
$ rabbitmqctl stop
```

rabbitmqctl stop命令把 rabbitmq 以及节点都关闭了，可以使用以下命令启动 rabbitmq，参数-detached 表示以守护程序的方式在后台运行

```
$ rabbitmq-server -detached
```

## 添加用户

```
rabbitmqctl add_user admin password

rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"

rabbitmqctl set_user_tags admin administrator
```

## 彻底卸载
### rabbitmq
先删除mq
```
sudo apt-get remove rabbitmq-server
```

然后查看依赖, 有ii的继续remove
```
dpkg --list|grep rabbitmq
```

### erlang
先删除erlang
```
sudo apt-get remove erlang
```

然后查看依赖, 有ii的继续remove
```
dpkg --list|grep erlang
```
