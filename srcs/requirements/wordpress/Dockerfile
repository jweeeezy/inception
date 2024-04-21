### Dockerfile for wordpress and php

# penultimate latest version as of 01/14/2024
FROM debian:11

# installation of all necessary tools
RUN apt-get update -y && apt-get upgrade -y && mkdir -p /tmp/
COPY --chmod=755 ./tools/install_php.sh /tmp/install_php.sh
RUN /tmp/install_php.sh

# @note not sure if needed (compose.yml should handle this)
EXPOSE 9000

# start php as main process
#CMD ["php-fpm7.4", "-F"]
ENTRYPOINT ["tail", "-f", "/dev/null"]
