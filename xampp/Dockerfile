FROM ubuntu:18.04
MAINTAINER zhangjian@lingrengame.com
RUN apt update && apt-get -yq --no-install-recommends install libssh2-1 libssh2-1-dev net-tools mysql-client && rm -rf /var/lib/apt/lists/*
ADD files/xampp-linux-x64-1.8.3-5-installer.run /opt/xampp-linux-x64-1.8.3-5-installer.run
RUN cd /opt && chmod 755 xampp-linux-x64-1.8.3-5-installer.run && \
	echo 'Y' | echo 'Y' | echo ' ' | echo 'Y' | ./xampp-linux-x64-1.8.3-5-installer.run && \
	rm -rf /opt/lampp/htdocs/* && \
	mkdir -p /opt/lampp/htdocs/public && \
	mkdir -p /data/logs/apache/ && \
	chmod 755 /opt/lampp/htdocs/public && \
	rm -rf /etc/localtime
ADD files/*.so /opt/lampp/lib/php/extensions/no-debug-non-zts-20121212/
ADD files/httpd.conf /opt/lampp/etc/httpd.conf
ADD files/php.ini /opt/lampp/etc/php.ini
ADD files/httpd-mpm.conf /opt/lampp/etc/extra/httpd-mpm.conf
ADD files/localtime /etc/localtime
ADD run.sh /opt/lampp/
WORKDIR	/opt/lampp
RUN chmod -R 755 /opt/lampp/lib/php/extensions/no-debug-non-zts-20121212/* && \
	rm -rf /opt/xampp-linux-x64-1.8.3-5-installer.run && \
	chmod 755 run.sh && \
	sed -i '129c \        \"$XAMPP_ROOT/bin/apachectl" -k start -E "$XAMPP_ROOT/logs/error_log" $apachedefines -D FOREGROUND > /dev/null 2>&1' xampp
EXPOSE 80
ENTRYPOINT ["/opt/lampp/run.sh"]
