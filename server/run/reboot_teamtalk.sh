# 用于重新启动整个server
# create by jiangc@2019/6/18

#!/bin/sh

# 启动php-fmp
function restartphpfmp()
{
	PID=
	PID=`ps -ef | grep "php-fpm" | grep master |grep -v grep | awk '{print $2}'`
	echo $PID
	if [ -z "$PID" ];then
		echo "IS NULL"
		LIST=
		LIST=`ps -ef | grep "php-fpm" |grep -v grep | awk '{print $2}'`
		for i in $LIST;
		do
			kill -9 $i
		done
		/usr/local/php5/sbin/php-fpm
	else
		echo "NOT NULL"
		kill -USR2 $PID
	fi
	ps -ef | grep php-fpm
}


./restart.sh all #重启所有服务

# 临时关闭selinux
getenforce 
setenforce 0

# 重启nginx
systemctl restart nginx
systemctl status nginx

# 启动php-fmp
restartphpfmp

