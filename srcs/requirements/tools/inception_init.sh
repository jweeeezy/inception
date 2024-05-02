#!/bin/bash

# this script is responsible for:
# - prompting user for each env variable / docker secret
# - setting up the .env file with necessary variables
# - setting up the docker secret files (credentials)

ENV_FILE="../../../srcs/.env"
SECRET_DB_ROOT_FILE="../../../secrets/.secrets_db_root"
SECRET_WP_ADMIN_FILE="../../../secrets/.secrets_wp_admin"
SECRET_WP_USER_FILE="../../../secrets/.secrets_wp_user"
WORDPRESS_DATA_DIR="$HOME/data/wordpress"
MARIADB_DATA_DIR="$HOME/data/mariadb"

check_for_file(){
    test -f $1
    if [ $? == 0 ]; then
        echo "init_script: $1 exists already..."
        return 1
    fi
}

check_for_file_creation(){
    test -f $1
    if [ $? == 1 ]; then
        echo "init_script: $1 wasn't created..."
        return 1
    fi
}

ask_for_reinit(){
    local response
    while true; do
        read -p "Do you want to reinit the project? (y/n): " response
        case $response in
            [Yy]* ) delete_all_init_files && return 0;;
            [Nn]* ) exit 0;;
            * ) echo "Please enter 'y' or 'n'.";;
        esac
    done
}

delete_all_init_files(){
    rm $ENV_FILE || true
    rm $SECRET_DB_ROOT_FILE || true
    rm $SECRET_WP_ADMIN_FILE || true
    rm $SECRET_WP_USER_FILE || true
}

read_and_create_file(){
    description=$1
    while [ -v $var ]; do
        read -p "$description" var
    done
    echo "$2=$var" > "$3"
    unset var
}

read_and_create_secret_file(){
    description=$1
    while [ -v $var ]; do
        read -p "$description" var
    done
    echo "$var" > "$3"
    unset var
}

read_and_append_to_file(){
    description=$1
    while [ -v $var ]; do
        read -p "$description" var
    done
    echo "$2=$var" >> "$3"
    unset var
}

main(){
    sudo mkdir -p $WORDPRESS_DATA_DIR
    sudo mkdir -p $MARIADB_DATA_DIR
    check_for_file $ENV_FILE || ask_for_reinit
    check_for_file $SECRET_DB_ROOT_FILE || ask_for_reinit
    check_for_file $SECRET_WP_ADMIN_FILE || ask_for_reinit
    check_for_file $SECRET_WP_USER_FILE || ask_for_reinit

    read_and_create_file "Enter the database name: " "MARIADB_DB_NAME" "$ENV_FILE"
    read_and_append_to_file "Enter the database root username: " "MARIADB_ROOT_USER_NAME" "$ENV_FILE"
    read_and_create_secret_file "Enter the database root password: " "MARIADB_ROOT_PASSWORD" "$SECRET_DB_ROOT_FILE"

    read_and_append_to_file "Enter the wordpress admin username: " "WORDPRESS_ADMIN_NAME" "$ENV_FILE"
    read_and_create_secret_file "Enter the wordpress admin password: " "WORDPRESS_ADMIN_PASSWORD" "$SECRET_WP_ADMIN_FILE"

    read_and_append_to_file "Enter the wordpress user username: " "WORDPRESS_USER_NAME" "$ENV_FILE"
    read_and_create_secret_file "Enter the wordpress user password: " "WORDPRESS_USER_PASSWORD" "$SECRET_WP_USER_FILE"

    check_for_file_creation $ENV_FILE || ask_for_reinit
    check_for_file_creation $SECRET_DB_ROOT_FILE || ask_for_reinit
    check_for_file_creation $SECRET_WP_ADMIN_FILE || ask_for_reinit
    check_for_file_creation $SECRET_WP_USER_FILE || ask_for_reinit
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then main; fi
