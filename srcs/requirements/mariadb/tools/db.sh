#!/bin/bash

mv /my.cnf /etc/mysql/my.cnf
mysql_install_db
/etc/init.d/mysql start
/secure_install.sh
/set_db.sh | mysql -u root
sleep 5
/etc/init.d/mysql stop
sleep 5
