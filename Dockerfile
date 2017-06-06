FROM centos:7
MAINTAINER Florax <simple.sharky@gmail.com>
LABEL Description="Linux+PHP 5.4. CentOS 7 based. \


RUN yum -y update && yum clean all
RUN yum -y install gcc php-pear php-devel make openssl-devel && yum clean all
RUN yum install -y \
	mysql \
	php \
	php-common \
	php-dba \
	php-gd \
	php-intl \
	php-mbstring \
	php-mysqlnd \
	php-odbc \
	php-pdo \
	php-pcre \
	php-spl \
	php-openssl \
	php-intl \
	php-icu \
	php-fileinfo \
	php-dom \
	php-curl \
	php-gd \
	wget \
	net-tools \
RUN wget http://downloads.zend.com/guard/6.0.0/ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64.tar.gz
RUN tar -zxvf ZendGuardLoader-*.tar.gz

COPY ZendGuardLoader-php-5.3-linux-glibc23-i386/php-5.3.x/ZendGuardLoader.so /usr/lib64/php/


RUN sh -c 'echo zend_extension=/usr/lib64/php/ZendGuardLoader.so >> /etc/php.d/zend.ini'

ENV LOG_STDOUT **Boolean**
ENV LOG_STDERR **Boolean**
ENV LOG_LEVEL warn
ENV ALLOW_OVERRIDE All
ENV DATE_TIMEZONE UTC





EXPOSE 80

