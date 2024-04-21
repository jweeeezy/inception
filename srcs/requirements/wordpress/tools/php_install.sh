#!/bin/bash

# source: https://php.watch/articles/php-8.3-install-upgrade-on-debian-ubuntu#php83-debian-quick
# on debian:11 php is outdated / unsupported

apt-get install apt-transport-https lsb-release curl -y
curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt-get update -y && apt upgrade -y
apt-get install -y php8.3 php8.3-fpm php8.3-mysql php8.3-cli php8.3-{bz2,curl,mbstring,intl}
echo "Script ran successfully!" 1>&2 
