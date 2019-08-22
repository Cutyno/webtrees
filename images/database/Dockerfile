#setting mysql version
ARG MYSQL_VERSION=5.7
FROM mysql:$MYSQL_VERSION

#set basis sql dump
ADD dump.sql /docker-entrypoint-initdb.d/sample.sql
