FROM alpine

RUN apk update && apk upgrade
RUN apk add mysql mysql-client vim supervisor
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /etc/telegraf
RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql

COPY /srcs/start.sh         .
COPY /srcs/start_mysql.sh   .
COPY /srcs/my.cnf           /etc/my.cnf
COPY /srcs/telegraf.conf    /etc/telegraf/telegraf.conf
COPY /srcs/supervisord.conf /etc/supervisord.conf
RUN chmod +x start.sh
RUN chmod +x start_mysql.sh

VOLUME  ["/var/lib/mysql"]

CMD [ "sh", "start.sh" ]