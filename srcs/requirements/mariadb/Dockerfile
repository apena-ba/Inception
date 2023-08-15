FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server mariadb-client

COPY config/my.cnf /my.cnf
COPY tools/.env /.env

COPY tools/db.sh /db.sh
COPY tools/secure_install.sh /secure_install.sh
COPY tools/set_db.sh /set_db.sh
RUN chmod +x /db.sh /secure_install.sh /set_db.sh

EXPOSE 3306

RUN export $(cat /.env | xargs) && \
	sh /db.sh

CMD ["mysqld"]
