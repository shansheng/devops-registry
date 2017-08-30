#!/bin/bash

#
# Copyright (c) 2001-2018 Primeton Technologies, Ltd.
# All rights reserved.
#
# author: ZhongWen Li (mailto:lizw@primeton.com)
#

CONFIG_PATH=${TOMCAT_HOME}/webapps/ROOT/WEB-INF/_srv/config

if [ -z "${MYSQL_DATABASE}" ]; then
  echo "[`date`] [WARN ] Missing enviroment variable MYSQL_DATABASE, use default value: devops"
  MYSQL_DATABASE=devops
fi
if [ -z "${MYSQL_USER}" ]; then
  echo "[`date`] [WARN ] Missing enviroment variable MYSQL_USER, use default value: devops"
  MYSQL_USER=devops
fi
if [ -z "${MYSQL_PASSWORD}" ]; then
  echo "[`date`] [WARN ] Missing enviroment variable MYSQL_PASSWORD, use default value: devops"
  MYSQL_PASSWORD=devops
fi
if [ -z "${MYSQL_HOST}" ]; then
  echo "[`date`] [WARN ] Missing enviroment variable MYSQL_HOST, use default value: mysql"
  MYSQL_HOST=mysql
fi

if [ -f ${CONFIG_PATH}/user-config-template.xml ]; then
  \cp -f ${CONFIG_PATH}/user-config-template.xml ${CONFIG_PATH}/user-config.xml
  sed -i -e "s/MYSQL_DATABASE/${MYSQL_DATABASE}/g" ${CONFIG_PATH}/user-config.xml
  sed -i -e "s/MYSQL_USER/${MYSQL_USER}/g" ${CONFIG_PATH}/user-config.xml
  sed -i -e "s/MYSQL_PASSWORD/${MYSQL_PASSWORD}/g" ${CONFIG_PATH}/user-config.xml
  sed -i -e "s/MYSQL_HOST/${MYSQL_HOST}/g" ${CONFIG_PATH}/user-config.xml
fi

${TOMCAT_HOME}/bin/entrypoint.sh