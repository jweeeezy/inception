### Dockerfile for mariadb

FROM debian:11


# @note sure if creating dir is needed 
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install mariadb-server -y
COPY ./conf/my.cnf /etc/mysql/my.cnf
#COPY ./tools/wp_setup_instructions.sql /tmp/wp_setup_instructions.sql
COPY --chmod=755 ./tools/test_script.sh /tmp/test_script.sh
RUN /etc/init.d/mariadb start && /tmp/test_script.sh

EXPOSE 3306

ENTRYPOINT ["mysqld_safe"]
