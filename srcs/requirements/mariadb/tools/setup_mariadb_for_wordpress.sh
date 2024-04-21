
# mb chmod // chown -R following folders: /run/mysqld /var/lib/mysql /var/log/mysql

mariadb -e"CREATE DATABASE IF NOT EXISTS $MARIADB_DB_NAME"
mariadb -e"CREATE USER IF NOT EXISTS '$MARIADB_USER_NAME'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD'"
mariadb -e"GRANT ALL PRIVILEGES ON $MARIADB_DB_NAME TO '$MARIADB_USER_NAME'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# create a database for wordpress (with env variable)
# create a wordpress database admin + passwd
# create a wordpress user + passwd (readonly)
# grant privileges for wordpress-db for wordpress user
# flush privileges

# @note % to give acccess from any host (like docker containers)

# code example:
#CREATE USER 'boss'@'%' IDENTIFIED BY 'some_pass';
#GRANT ALL PRIVILEGES ON *.* TO 'boss'@'%' WITH GRANT OPTION;
#FLUSH PRIVILEGES;

# CREATE USER 'pleb'@'%' IDENTIFIED BY 'some_pass';
# GRANT SELECT, INSERT, UPDATE ON 'database-name'.* TO 'pleb'@'%';
# FLUSH PRIVILEGES;
