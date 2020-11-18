FROM alpine

RUN apk update && apk upgrade
RUN apk add mysql mysql-client vim

RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql

COPY ./srcs ./
RUN chmod +x start.sh
RUN mv my.cnf /etc/my.cnf

VOLUME  ["/var/lib/mysql"]

CMD [ "sh", "start.sh" ]