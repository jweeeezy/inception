### Dockerfile for mariadb

FROM debian:11

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY --chmod=755 ./tools/setup_mariadb_for_wordpress.sh /tmp/setup_mariadb_for_wordpress.sh

#RUN /tmp/setup_mariadb_for_wordpress.sh

EXPOSE 3306

CMD ["mysqld_safe"]
