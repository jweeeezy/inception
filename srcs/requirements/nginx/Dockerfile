### Dockerfile for nginx

# penultimate latest version as of 01/14/2024
FROM debian:11

# installation of all necessary tools
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx -y

# @note wip
#RUN mkdir /etc/nginx/ssl
#COPY ./ssl/inceptionhost.crt ./ssl/inceptionhost.key /etc/nginx/ssl/

RUN mkdir /etc/nginx/ssl
WORKDIR /etc/nginx/ssl
COPY openssl.cnf ./
COPY /tools/create_tls_certificates.sh ./
RUN ./create_tls_certificates.sh

# copies the custom config file for nginx onto container
WORKDIR ~
COPY custom-nginx.conf /etc/nginx/conf.d/

EXPOSE 443

# starts nginx as a foreground process without the daemon so it keeps running
CMD ["nginx", "-g", "daemon off;"]

