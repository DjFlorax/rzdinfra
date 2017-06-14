FROM debian:jessie
MAINTAINER Florax <simple.sharky@gmail.com>
LABEL Description="Linux+PHP 5.4. Debian based. \

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get -qq update && \
  apt-get -qq install \
  mysql-client \
  php5 \
  libpcre3 \
  php5-cli \
  php5-intl \
  php5-curl \
  php5-gd \
  php5-mysql \
  wget \
  net-tools \
    && \
  apt-get clean

RUN wget http://downloads.zend.com/guard/7.0.0/zend-loader-php5.6-linux-x86_64.tar.gz
RUN tar -zxvf zend-loader-php5.6-linux-x86_64.tar.gz
RUN chown -R root:root zend-loader-php5.6-linux-x86_64 

RUN cp /zend-loader-php5.6-linux-x86_64/ZendGuardLoader.so /usr/lib/php5/


RUN sh -c 'echo zend_extension=/usr/lib/php5/ZendGuardLoader.so >> /etc/php5/apache/php.ini'
RUN sh -c 'echo zend_loader.enable=1 >> /etc/php5/apache/php.ini'

CMD ["php-conf"]

EXPOSE 80 3306
