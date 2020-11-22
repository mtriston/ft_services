FROM alpine

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor vim
RUN     apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /run/nginx
RUN mkdir -p /etc/telegraf

#create user for ssh connection
RUN adduser -D mtriston && echo "mtriston:mtriston" | chpasswd

RUN openssl req \
            -x509 -nodes -days 30 \
			-subj '/C=RU/L=Moscow/O=School21/CN=Messenger Triston' \
			-newkey rsa:2048 -keyout /etc/ssl/cert.key -out /etc/ssl/cert.crt
            

COPY ./srcs ./
RUN mv supervisord.conf /etc/supervisord.conf
RUN mv nginx.conf       /etc/nginx/conf.d/default.conf
RUN mv telegraf.conf	/etc/telegraf/telegraf.conf
RUN chmod +x start.sh
RUN chmod +x start_ssh.sh

EXPOSE 80 443 22

CMD [ "sh", "start.sh" ]