FROM alpine

RUN apk update && apk upgrade
RUN apk add supervisor vim

WORKDIR /usr/share/grafana

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /etc/telegraf

COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY /srcs/telegraf.conf    /etc/telegraf/telegraf.conf
COPY /srcs/grafana.db       /usr/share/grafana/data/grafana.db

COPY /srcs/start.sh .
RUN chmod +x start.sh

EXPOSE 3000

CMD [ "sh", "start.sh" ]