#!/bin/sh

sudo apt-get update
sudo apt-get install mysql-server libmysqlclient-dev
sudo mysql_secure_installation
