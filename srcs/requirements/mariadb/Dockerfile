### Dockerfile for mariadb

FROM debian:11

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

EXPOSE 3306

CMD ["mysqld_safe"]
