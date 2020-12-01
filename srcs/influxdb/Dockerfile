FROM alpine

RUN apk update && apk upgrade
RUN apk add influxdb supervisor vim
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /etc/telegraf

COPY /srcs/start.sh .
RUN chmod +x start.sh

COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY /srcs/telegraf.conf    /etc/telegraf/telegraf.conf

EXPOSE 8086

VOLUME  ["/var/lib/influxdb"]

CMD [ "sh", "start.sh" ]