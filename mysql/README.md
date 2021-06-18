此处整理MySQL5.7的容器化部署方式，其中遇到一些诡异问题，特此记录：

1.在首次尝试启动容器的时候，启动指令如下：
docker run -p 3306:3306 --privileged=true --name mysql -v /data/mysql/log:/var/log/mysql -v /data/mysql/data:/var/lib/mysql -v /data/mysql/conf:/etc/mysql -e MYSQL_ROOT_PASSWORD='Lingren@dl' -d mysql:5.7

挂载了三个目录
/data/mysql/log		MySQL运行日志路径
/data/mysql/data	MySQL的数据路径
/data/mysql/conf	MySQL的篇日志文件路径

但是启动之后，只有/data/mysql/data目录下显示有数据，也就是挂载正常，其他两个路劲为空，且进去到docker内部查看，对应路径也是空！！！

这就很诡异了~

/etc/mysql/下怎么会为空呢~

起初考虑是容器的问题，是不是放到其他地方去了？

后来发现，如果不挂载那两个路径，容器里的文件就出现了~

最终，定位到/data/mysql/conf这个路径需要定位到具体文件才能正确挂载上去~

因此，最后的启动指令为：
docker run -p 3306:3306 --privileged=true --name mysql -v /data/mysql/data/:/var/lib/mysql/ -v /data/mysql/conf/my.cnf:/etc/mysql/my.cnf -e MYSQL_ROOT_PASSWORD='Lingren@dl' -d mysql:5.7

错误日志的映射被我去掉了，感觉不是很有必要~

至此，配置文件和数据路径的挂载就实现了~
