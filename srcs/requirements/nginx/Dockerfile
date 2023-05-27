FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx openssl -y

RUN mkdir /ssl
RUN openssl req -x509 -sha256 -days 356 -nodes -newkey rsa:2048 -subj "/CN=apena-ba.42.fr/C=ES/L=Malaga" -keyout /ssl/key.key -out /ssl/cert.crt

COPY config/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

