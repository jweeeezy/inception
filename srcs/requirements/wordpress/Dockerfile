### Dockerfile for wordpress and php

# penultimate latest version as of 01/14/2024
FROM debian:11

# installation of all necessary tools
RUN apt-get update -y && apt-get upgrade -y && mkdir -p /tmp/
COPY --chmod=755 ./tools/php_install.sh /tmp/php_install.sh
COPY --chmod=755 ./tools/wp_install.sh /tmp/wp_install.sh
RUN /tmp/php_install.sh && /tmp/wp_install.sh

# @note not sure if needed (compose.yml should handle this)
EXPOSE 9000

# start php as main process
#CMD ["php-fpm7.4", "-F"]
ENTRYPOINT ["tail", "-f", "/dev/null"]
