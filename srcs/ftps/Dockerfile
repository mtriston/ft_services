FROM alpine

RUN apk update && apk upgrade
RUN apk add vsftpd openssl vim supervisor
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN openssl req \
            -x509 -nodes -days 30 \
			-subj '/C=RU/L=Moscow/O=School21/CN=Messenger Triston' \
			-newkey rsa:2048 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem

RUN mkdir -p /etc/telegraf

COPY /srcs/vsftpd.conf	/etc/vsftpd/vsftpd.conf
COPY /srcs/start.sh     .
RUN chmod +x start.sh

RUN adduser -D mtriston && passwd mtriston -d 'mtriston'

EXPOSE 20 21 10100

CMD [ "sh", "start.sh" ]