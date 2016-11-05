# tomcat的配置，tomcat-8.0.38
## 路径
--tomcat/
------bin/
------conf/
------lib/

## conf 增加
jmaven_8080.properties
jmaven_8080.xml

## bin 
移动jar到lib中，清除sh并增加
execute.sh
jmaven_8080.sh

## 启动
./jmaven_8080.sh start

## 其他
xml中的protocol：bio、nio、apr

## apr的配置
http://love-love-l.blog.163.com/blog/static/21078304201311564236996/


