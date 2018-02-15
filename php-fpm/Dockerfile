FROM php:7.1-fpm-alpine

RUN apk add --no-cache --update bash

COPY php.ini /usr/local/etc/php/php.ini

COPY *.php /var/www/html/

ENV LOG_STREAM="/tmp/stdout"
RUN mkfifo $LOG_STREAM && chmod 777 $LOG_STREAM
COPY run.sh /
RUN chmod +x /run.sh
CMD ["/run.sh"]
