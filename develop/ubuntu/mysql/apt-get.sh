#!/bin/bash
step 1.
sudo apt-get update

step 2.
sudo apt-get install mysql-server mysql-client

input: y
intpu: password

step 3.
sudo service mysql restart


other:
apache 
sudo apt-get install libapache2-mod-auth-mysql

php
sudo apt-get install php5-mysql
