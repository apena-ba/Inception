FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y curl php7.3-fpm php7.3-mysql php7.3-xml php7.3-curl php7.3-mbstring php7.3-zip

RUN mkdir /script
RUN useradd userwp && groupadd groupwp && usermod -aG groupwp userwp

COPY config/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY tools/wp.sh /script/wp.sh

RUN chmod +x /script/wp.sh

EXPOSE 9000

CMD ["sh", "/script/wp.sh"]

