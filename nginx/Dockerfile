FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx -y

RUN mkdir /ssl
COPY tools/key.key /ssl/key.key
COPY tools/cert.crt /ssl/cert.crt

COPY config/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

