# this Dockerfile is responsible for:
# - installing php and wordpress
# - setting up php config file
# - setting up wordpress and mariadb connection
# - running php-fpm as foreground process
FROM debian:11
RUN apt-get update -y \
    && apt-get upgrade -y \
    && mkdir -p /var/run/php \
    && mkdir -p /var/www/html

WORKDIR /var/www/html

# this config file is responsible for:
# source: https://gist.github.com/rvanzee/2352093
# - setting up remote access via port 9000
# - necessary (default) settings for php-fpm
COPY ./conf/www.conf /tmp/www.conf

# source: https://php.watch/articles/php-8.3-install-upgrade-on-debian-ubuntu#php83-debian-quick
# on debian:11 php is outdated / unsupported
COPY --chmod=755 ./tools/php_install.sh /tmp/php_install.sh

# source: https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/
COPY --chmod=755 ./tools/wp_install.sh /tmp/wp_install.sh
RUN /tmp/php_install.sh && /tmp/wp_install.sh

COPY --chmod=755 ./tools/wp_init.sh /tmp/wp_init.sh

ENTRYPOINT [ "/tmp/wp_init.sh" ]
