FROM alpine

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor vim

RUN mkdir -p /run/nginx

RUN openssl req \
            -x509 -nodes -days 30 \
			-subj '/C=RU/L=Moscow/O=School21/CN=Messenger Triston' \
			-newkey rsa:2048 -keyout /etc/ssl/cert.key -out /etc/ssl/cert.crt
            
COPY ./srcs ./
RUN mv supervisord.conf /etc/supervisord.conf
RUN mv nginx.conf       /etc/nginx/conf.d/default.conf
RUN chmod +x start.sh

EXPOSE 80 443 22

CMD [ "sh", "start.sh" ]