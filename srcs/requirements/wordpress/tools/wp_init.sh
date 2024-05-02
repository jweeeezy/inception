#!/bin/bash

WORDPRESS_ADMIN_PASSWORD=$(cat /run/secrets/wordpress_admin_password)
WORDPRESS_USER_PASSWORD=$(cat /run/secrets/wordpress_user_password)
MARIADB_ROOT_PASSWORD=$(cat /run/secrets/mariadb_root_password)

rm /var/www/html/wp-config.php || true

wp config create --allow-root --path="/var/www/html" \
    --dbname="$MARIADB_DB_NAME" --dbuser="$MARIADB_ROOT_USER_NAME" --dbpass="$MARIADB_ROOT_PASSWORD" --dbhost=mariadb

wp core install --allow-root --path="/var/www/html" --url=https://jwillert.42.fr \
	--admin_user="$WORDPRESS_ADMIN_NAME" --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
	--admin_email="jwillert@student.42heilbronn.de" --title="inception" --skip-email
wp user create --allow-root $WORDPRESS_USER_NAME "willertjakob@gmail.com" \
    --role=author --user_pass="$WORDPRESS_USER_PASSWORD"

exec php-fpm8.3 -F
