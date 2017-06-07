FROM debian:jessie
MAINTAINER Florax <simple.sharky@gmail.com>
LABEL Description="Linux+PHP 5.4. Debian based. \


RUN \
  apt-get -qq update && \
  apt-get -qq install \
  mysql \
  apt-get -qq install \
    php5 php5-pcre php5-spl php5-mbstring php5-openssl php5-intl php5-icu php5-fileinfo php5-dom php5-curl php5-gd php5-mysql \
    && \
  apt-get clean

RUN wget http://downloads.zend.com/guard/6.0.0/ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64.tar.gz
RUN tar -zxvf ZendGuardLoader-*.tar.gz

COPY ZendGuardLoader-php-5.3-linux-glibc23-i386/php-5.3.x/ZendGuardLoader.so /usr/lib64/php/


RUN sh -c 'echo zend_extension=/usr/lib64/php/ZendGuardLoader.so >> /etc/php.d/zend.ini'

EXPOSE 80

