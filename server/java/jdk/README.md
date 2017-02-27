# jdk配置

1. vim /etc/profile

	export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_71  
	export JRE_HOME=${JAVA_HOME}/jre  
	export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib  
	export PATH=${JAVA_HOME}/bin:$PATH  

2. source /etc/profile