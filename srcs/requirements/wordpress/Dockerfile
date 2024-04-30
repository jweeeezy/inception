### Dockerfile for wordpress and php

# penultimate latest version as of 01/14/2024
FROM debian:11

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install mariadb-client -y \
    && mkdir -p /var/run/php \
    && mkdir -p /var/www/html

WORKDIR /var/www/html

COPY ./conf/www.conf /tmp/www.conf
COPY --chmod=755 ./tools/php_install.sh /tmp/php_install.sh
COPY --chmod=755 ./tools/wp_install.sh /tmp/wp_install.sh
RUN /tmp/php_install.sh && /tmp/wp_install.sh

COPY --chmod=755 ./tools/wp_init.sh /tmp/wp_init.sh

EXPOSE 9000

ENTRYPOINT [ "/tmp/wp_init.sh" ]
