# this Dockerfile is responsible for:
# - installing nginx, openssl
# - setting up directories
# - running ssl certificate script
# - setup custom nginx config file
# - starting nginx service as foreground process
FROM debian:11
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install nginx -y \
    && apt-get install openssl -y \
    && mkdir -p /etc/nginx/ssl

WORKDIR /etc/nginx/ssl

# config file for openssl (TLS key and certificate generation)
COPY conf/openssl.cnf ./

# this script is responsible for:
# - enabling TLS1.3/SSL authentification for connection to nginx
# - creating a key for the host
# - creating a siqning request
# - signing the certificate for 30 days with given config
COPY --chmod=755 /tools/create_tls_certificates.sh ./
RUN ./create_tls_certificates.sh

# custom nginx configuration file
# source: https://www.nginx.com/resources/wiki/start/topics/recipes/wordpress/
# this config file is responsible for:
# - redirecting from port 80 / http --> https at port 443
# - setting up TLS 1.3 // ssl authentification for the webserver
# - setting up how php files will be processed (communicate with wordpress container)
# - setting up wordpress/nginx shared files
COPY conf/custom-nginx.conf /etc/nginx/conf.d/

ENTRYPOINT ["nginx", "-g", "daemon off;"]
