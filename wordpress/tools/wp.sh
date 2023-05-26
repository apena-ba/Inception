#!/bin/bash

if ! [ -f /var/www/html/wp-config.php ]; then
	# Create dir if doesnt exist
	if ! [ -d /var/www/html ]; then
		mkdir -p /var/www/html
	fi
	# Download wp-cli to get wp files and configure wp
	curl -o /wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x /wp-cli.phar
	mv /wp-cli.phar /usr/local/bin/wp
	wp core download --path=/var/www/html --allow-root
	mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wp-config.php
	sed -i "s/localhost/inception_db.inception_net/g" /var/www/html/wp-config.php
	sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wp-config.php
	sed -i "s/database_name_here/$MYSQL_DB/g" /var/www/html/wp-config.php
	# Creates wp tables in db
	wp core install --allow-root --url=$DOMAIN_NAME \
		--title=$WP_NAME \
		--admin_user=$WP_ROOT_USER \
		--admin_password=$WP_ROOT_PASSWORD \
		--admin_email=$WP_ROOT_EMAIL \
		--path=/var/www/html
	wp user create $MYSQL_USER $WP_USER_EMAIL \
		--user_pass=$MYSQL_PASSWORD \
		--role=author --allow_root \
		--path=/var/www/html
fi

chown -R userwp /var/www/html  && chmod -R 775 /var/www/html

php-fpm7.3 -y /etc/php/7.3/fpm/php-fpm.conf -F
