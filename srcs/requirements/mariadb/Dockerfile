### Dockerfile for mariadb

FROM debian:11

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y

EXPOSE 3306

# @note needed?
# sudo mysql_secure_installation

CMD ["mysqld_safe"]
