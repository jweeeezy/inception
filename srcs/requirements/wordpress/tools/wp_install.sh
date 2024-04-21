#!/bin/bash

# source: https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --path=/var/www/html --allow-root
