#!/bin/bash
set -e
#设定MySQL的初始root密码
MYPWD='***'

function Pull_Mysql() {
	docker pull mysql:5.7
	mkdir -p /data/mysql/conf && mv -b /root/init/my.cnf /data/mysql/conf
	docker run -p 3306:3306 --name mysql --privileged=true -v /data/mysql/data:/var/lib/mysql -v /data/mysql/conf/my.cnf:/etc/mysql/my.cnf -e MYSQL_ROOT_PASSWORD="$MYPWD" -d mysql:5.7
	sleep 2
	ret=`docker ps | grep mysql | wc -l`
	if [[ $ret -eq 0 ]];then
		echo 'MySQL容器启动失败,请检查'
		exit 1
	else
		echo 'MySQL容器启动成功'
	fi
}
