#!/bin/bash
#ubuntu
sudo apt-get update
sudo apt-get install mysql-server mysql-client
#input y
#input password

## apache support
sudo apt-get install libapache2-mod-auth-mysql

## php support
sudo apt-get install php5-mysql

# cmd
sudo service mysql restart
