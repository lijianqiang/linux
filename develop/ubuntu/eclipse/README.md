﻿# eclipse配置
> ubuntu 14.04



## 1.写个eclipse.sh
文件

## 2.新建eclipse.desktop
> [Desktop Entry]  
> Name=Eclipse  
> Comment=Eclipse SDK  
> Encoding=UTF-8  
> Exec=/opt/eclipse/eclipse.sh  
> Icon=/opt/eclipse/icon.xpm  
> Terminal=false  
> Type=Application  
> Categories=Application;Development;


## 3.安装subclipse
> subclipse  svn
> 1.12x	   1.9x
> 1.10x	   1.8x


## 4.配置库
安装javahl
> sudo apt-get install libsvn-java

然后找
> sudo find / -name libsvnjavahl-1.so

然后加参数-vmargs下面
> -Djava.library.path=/usr/lib/x86_64-linux-gnu/jni


http://subclipse.tigris.org/wiki/JavaHL
