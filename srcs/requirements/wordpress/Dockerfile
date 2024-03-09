### Dockerfile for wordpress and php

# penultimate latest version as of 01/14/2024
FROM debian:11

# installation of all necessary tools
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install php-fpm -y
#RUN apt-get install wordpress

# copy code to container
COPY . /var/html/www

# @note not sure if needed (compose.yml should handle this)
EXPOSE 9000

# start php as main process
#CMD ["php-fpm7.4", "-F"]
ENTRYPOINT ["tail", "-f", "/dev/null"]
