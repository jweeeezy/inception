# this Dockerfile is responsible for:
# - installing mariadb-server
# - setup custom mariadb config file
# - starting init script (start mariadb in foreground, setup sql instructions)
FROM debian:11
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install mariadb-server -y

WORKDIR /etc/mysql/

# this config file is responsible for:
# source: https://gist.github.com/flufy3d/19770db442d5262839401338ce2d2ff3
# - exposing port
# - allowing remote connections (socket, address)
# - logging errors
COPY ./conf/my.cnf /etc/mysql/my.cnf

# this script is responsible for:
# - creating an init file that the mariadb daemon can be initiated with
# - creating database for wordpress and a user that wordpress can connect with
# - setting up permissions and remote access for that user
# - starting up mariadb with init file
COPY --chmod=755 ./tools/mariadb_init.sh /tmp/mariadb_init.sh

ENTRYPOINT [ "/tmp/mariadb_init.sh" ]
