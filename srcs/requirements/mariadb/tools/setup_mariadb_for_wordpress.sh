
# mb chmod // chown -R following folders: /run/mysqld /var/lib/mysql /var/log/mysql

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

