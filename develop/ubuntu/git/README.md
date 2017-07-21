# git安装配置

## 1. 安装
> 可以使用apt-get方式安装，也可以下载源代码安装【1】，我们这里使用apt-git安装。
> 但由于直接使用 sudo apt-get install git 安装的版本较老，因此我们参考【2】中给出的PPA源。

    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install git

安装完成后，检查是否安装成功

    git --version

## 2. 设置Git

设置用户名和email。

    git config --global user.name "Your Name"
    git config --global user.email "youremail@domain.com"

> 此时，Home目录下会新建一个.gitconfig文件

## 3. 为GitHub账号添加SSH Keys

以公钥认证方式访问SSH协议的Git服务器时无需输入口令，而且更安全。
> 访问HTTP协议的Git服务器时，比如提交修改，每次都需要输入口令。

（1）创建SSH key

    ssh-keygen -t rsa -C "youremail@163.com"

> 系统会提示key的保存位置（一般是~/.ssh目录）和指定口令，保持默认，连续三次回车即可。

（2）Copy SSH Key

然后用vim打开该文件，id_rsa.pub文件内的内容，粘帖到github帐号管理的添加SSH key界面中

    vim ~/.ssh/id_rsa.pub

（3）添加到GitHub

登录github-> Accounting settings图标-> SSH key-> Add SSH key-> 填写SSH key的名称
> 可以起一个自己容易区分的

然后将拷贝的~/.ssh/id_rsa.pub文件内容粘帖-> add key”按钮添加。

（4）测试

    ssh -T git@github.com

## 4. 为GitHub上的Repository提交修改
（1）git clone已存在GitHub上的Repository。
> 在新建的~/MyTestFolder目录中

    git clone https://github.com/zhchnchn/ZhchnchnTest.git

（2）修改一个文件，然后提交

    vim README.md
    git status
    git add README.md
    git status
    git commit -m "Edit by WorkUbuntu 1204"
    git status
    git remote add origin https://github.com/zhchnchn/ZhchnchnTest.git

这时会报错误

    fatal: remote origin already exists.

解决办法【3】

执行

    git remote rm origin

然后再次执行

    git remote add origin https://github.com/zhchnchn/ZhchnchnTest.git

（3）之后，需要将修改push到GitHub上

    git push -u origin master

> 执行该条命令后，会要求输入GitHub账户的用户名和密码。

（4）提交完成后，查看GitHub上的Repository，会发现内容修改成功。

## Refer
【1】How To Install Git on Ubuntu 14.04（https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-14-04）

【2】Installing Latest version of git in ubuntu（http://stackoverflow.com/questions/19109542/installing-latest-version-of-git-in-ubuntu）

【3】Ubuntu12.04下安装Git（http://blog.csdn.net/biosd/article/details/9115837）

【4】CentOS6.6源码安装git-2.3.0（http://blog.csdn.net/goritcly/article/details/43878209）
    （http://www.centoscn.com/image-text/install/2015/0225/4735.html）
