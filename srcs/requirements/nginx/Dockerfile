### Dockerfile for nginx

# penultimate latest version as of 01/14/2024
FROM debian:11

# @note not sure if needed (compose.yml should handle this)
EXPOSE 443

# installation of all necessary tools
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install nginx -y \
    && apt-get install openssl -y

#   ---->

    # @note abstract this into a script
    # create key and self signed certificate
    RUN mkdir /etc/nginx/ssl
    WORKDIR /etc/nginx/ssl
    COPY conf/openssl.cnf ./
    COPY /tools/create_tls_certificates.sh ./
    RUN ./create_tls_certificates.sh

    # copy nginx config file
    WORKDIR ~
    COPY conf/custom-nginx.conf /etc/nginx/conf.d/

    # setup php
    COPY conf/info.php /var/www/html/info.php
    RUN chown -R $USER:$USER /var/www/html/info.php

#   <----

# starts nginx as a foreground process without the daemon so it keeps running
CMD ["nginx", "-g", "daemon off;"]

