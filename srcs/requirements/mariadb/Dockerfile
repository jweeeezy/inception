### Dockerfile for mariadb

FROM debian:11


# @note sure if creating dir is needed 
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install mariadb-server -y \
    && mkdir -p /var/lib/mysql && mkdir -p /run/mysqld
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/wp_setup_instructions.sql /tmp/wp_setup_instructions.sql
RUN /etc/init.d/mariadb start

EXPOSE 3306

ENTRYPOINT ["mariadbd", "--user=root", "--init-file", "/tmp/wp_setup_instructions.sql"]
