#!/bin/bash
# Script to set up dhis2 configuration file with the environment variables provided

# DB_HOST
while read a ; do echo ${a//DB_HOST/$DB_HOST} ; done < /dhis2/home/dhis.conf > /dhis2/home/dhis.conf.t ; mv /dhis2/home/dhis.conf{.t,}
# DB_USER
while read a ; do echo ${a//DB_USER/$DB_USER} ; done < /dhis2/home/dhis.conf > /dhis2/home/dhis.conf.t ; mv /dhis2/home/dhis.conf{.t,}
# DB_PWD
while read a ; do echo ${a//DB_PWD/$DB_PWD} ; done < /dhis2/home/dhis.conf > /dhis2/home/dhis.conf.t ; mv /dhis2/home/dhis.conf{.t,}
# TOMCAT_HOST
while read a ; do echo ${a//TOMCAT_HOST/$TOMCAT_HOST} ; done < /dhis2/home/dhis.conf > /dhis2/home/dhis.conf.t ; mv /dhis2/home/dhis.conf{.t,}
# TOMCAT_PORT
while read a ; do echo ${a//TOMCAT_PORT/$TOMCAT_PORT} ; done < /dhis2/home/dhis.conf > /dhis2/home/dhis.conf.t ; mv /dhis2/home/dhis.conf{.t,}
# RABBITMQ_HOST
while read a ; do echo ${a//RABBITMQ_HOST/$RABBITMQ_HOST} ; done < /dhis2/home/dhis.conf > /dhis2/home/dhis.conf.t ; mv /dhis2/home/dhis.conf{.t,}
# RABBITMQ_PORT
while read a ; do echo ${a//RABBITMQ_PORT/$RABBITMQ_PORT} ; done < /dhis2/home/dhis.conf > /dhis2/home/dhis.conf.t ; mv /dhis2/home/dhis.conf{.t,}
# RABBITMQ_USER
while read a ; do echo ${a//RABBITMQ_USER/$RABBITMQ_USER} ; done < /dhis2/home/dhis.conf > /dhis2/home/dhis.conf.t ; mv /dhis2/home/dhis.conf{.t,}
# RABBITMQ_PWD
while read a ; do echo ${a//RABBITMQ_PWD/$RABBITMQ_PWD} ; done < /dhis2/home/dhis.conf > /dhis2/home/dhis.conf.t ; mv /dhis2/home/dhis.conf{.t,}
