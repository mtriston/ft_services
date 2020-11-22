FROM alpine

RUN apk update && apk upgrade
RUN apk add wget nginx vim supervisor
RUN apk add php7-common php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-phar php7-cli php7-zip php7-iconv php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /etc/telegraf
RUN mkdir -p /run/nginx
RUN mkdir /www
RUN adduser -D -g 'www' www

COPY /srcs/start.sh         .
COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY /srcs/nginx.conf       /etc/nginx/conf.d/default.conf
COPY /srcs/telegraf.conf    /etc/telegraf/telegraf.conf
RUN chmod +x start.sh

EXPOSE 5050

CMD [ "sh", "start.sh" ]