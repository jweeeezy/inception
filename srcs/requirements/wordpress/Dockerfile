### Dockerfile for wordpress and php

# penultimate latest version as of 01/14/2024
FROM debian:11

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install mariadb-client -y \
    && mkdir -p /var/run/php \
    && mkdir -p /var/www/html
COPY --chmod=755 ./tools/php_install.sh /tmp/php_install.sh
COPY --chmod=755 ./tools/wp_install.sh /tmp/wp_install.sh
RUN /tmp/php_install.sh && /tmp/wp_install.sh

EXPOSE 9000

ENTRYPOINT ["php-fpm8.3", "-F"]
