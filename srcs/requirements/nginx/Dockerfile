### Dockerfile for nginx

# penultimate latest version as of 01/14/2024
FROM debian:11

# installation of all necessary tools
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y

# create key and self signed certificate
RUN mkdir /etc/nginx/ssl
WORKDIR /etc/nginx/ssl
COPY conf/openssl.cnf ./
COPY /tools/create_tls_certificates.sh ./
RUN ./create_tls_certificates.sh

# copy nginx config file
WORKDIR ~
COPY conf/custom-nginx.conf /etc/nginx/conf.d/

# @note not sure if needed (compose.yml should handle this)
EXPOSE 443

# starts nginx as a foreground process without the daemon so it keeps running
CMD ["nginx", "-g", "daemon off;"]

