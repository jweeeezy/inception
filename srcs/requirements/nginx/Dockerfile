### Dockerfile for nginx

FROM debian:11

EXPOSE 443

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install nginx -y \
    && apt-get install openssl -y

RUN mkdir /etc/nginx/ssl
WORKDIR /etc/nginx/ssl
COPY conf/openssl.cnf ./
COPY --chmod=755 /tools/create_tls_certificates.sh ./
RUN ./create_tls_certificates.sh

COPY conf/custom-nginx.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]

