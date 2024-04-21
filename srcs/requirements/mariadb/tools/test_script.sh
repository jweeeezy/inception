#!/bin/bash

mysqld -uroot &
while ! mysqladmin ping; do
    sleep 1
done

mariadb -e"CREATE DATABASE IF NOT EXISTS pipie;"
