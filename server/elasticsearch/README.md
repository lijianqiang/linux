# elasticsearch 套件

6.x 版本

## 1. elasticsearch
#### 解压即可

#### 用户 
新建非root用户

#### 启动  

bin/elasticsearch      //前台启动

bin/elasticsearch -d   //后台启动

#### 端口
9300  
9200


## 2. kibana
#### 解压即可

#### 启动
bin/kibana    //前台启动
nohup启动

#### 端口
loclahost:5601 //默认

## 3. logstash
#### 解压即可

#### 插件
如果你的Logstash没有安装logstash-codec-json_lines插件，通过以下命令安装：

`bin/plugin install logstash-codec-json_lines`

#### 启动配置
-f 的参数

bin/logstash  -f $CONF

