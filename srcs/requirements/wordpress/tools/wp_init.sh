#!/bin/bash

WORDPRESS_ADMIN_PASSWORD=$(cat /run/secrets/wordpress_admin_password)
WORDPRESS_USER_PASSWORD=$(cat /run/secrets/wordpress_user_password)

rm /var/www/html/wp-config.php || true
sleep 5
wp config create --url=jwillert.42.fr --dbname="$MARIADB_DATABASE_NAME" --dbuser=root \
	--allow-root --path="/var/www/html"
wp core install --url=jwillert.42.fr --title="wp-title" \
	--admin_user="${WORDPRESS_ADMIN_NAME}" --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
	--admin_email="jwillert@student.42heilbronn.de" --allow-root --path="/var/www/html"
wp user create --allow-root ${WORDPRESS_USER_NAME} "jwillert@student.42heilbronn.de" --role=author \
	--user_pass="$WORDPRESS_USER_PASSWORD"
exec php-fpm8.3 -F
