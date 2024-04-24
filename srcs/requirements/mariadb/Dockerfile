### Dockerfile for mariadb

FROM debian:11

# @note sure if creating dir is needed 
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install mariadb-server -y
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/init.sql /etc/mysql/init.sql

EXPOSE 3306

ENTRYPOINT [ "mariadbd", "--init-file", "/etc/mysql/init.sql" ]
