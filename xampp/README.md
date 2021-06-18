该服务为LR平台项xampp工具包的容器;
容器正常运行之后,仅将代码上传到挂载目录即可提供服务,无需考虑xampp原本的资源配置和依赖;

指令说明：

镜像构建指令
docker build -t xampp .

容器启动指令
docker run -d --name xampp_1 -p 80:80  -v /opt/lampp/htdocs/:/opt/lampp/htdocs/ -v /data/logs:/data/logs xampp

路径说明：

/opt/lampp/htdocs/              为代码的根目录,将程序代码上传至此处即可;

/data/logs                      为程序运行日志路径;

/data/logs/*** 的程序路径需要在宿主机上手动创建，否则登录入口平台或gm平台的时候会提示对应错误。

额外说明：

该容器仅解决了xampp的环境问题,由于需要部署的服务日益更新,并不负责特定服务的配置修改问题,也就是说,代码上传之后,依旧需要手动对该服务的相关配置做修改（提供服务的域名以及所要连接的数据库等）。

xampp的安装包过大，上传不了。
