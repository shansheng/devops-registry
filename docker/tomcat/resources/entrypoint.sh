#!/bin/bash

#
# Copyright (c) 2001-2018 Primeton Technologies, Ltd.
# All rights reserved.
#
# author: ZhongWen Li (mailto:lizw@primeton.com)
#

if [ -z ${TOMCAT_HOME} ]; then
  echo "[`date`] [ERROR] \${TOMCAT_HOME} not found."
  exit 1
fi
if [ ! -d ${TOMCAT_HOME} ]; then
  echo "[`date`] [ERROR] TOMCAT_HOME=${TOMCAT_HOME} not exists."
  exit 1
fi

if [ -z "${JAVA_VM_MEM_MIN}" ]; then
  JVM_MIN_MEM=512
fi
if [ -z "${JAVA_VM_MEM_MAX}" ]; then
  JVM_MAX_MEM=1024
fi
if [ ${JAVA_VM_MEM_MIN} -gt ${JAVA_VM_MEM_MAX} ]; then
  echo "[`date`] [WARN ] JAVA_VM_MEM_MIN is bigger than JAVA_VM_MEM_MAX"
  JAVA_VM_MEM_MAX=${JAVA_VM_MEM_MIN}
fi

JAVA_OPTS="${JAVA_OPTS} -Xms${JAVA_VM_MEM_MIN}m -Xmx${JAVA_VM_MEM_MAX}m"
JAVA_OPTS="${JAVA_OPTS} -Dfile.encoding=utf-8 -Duser.timezone=Asia/Shanghai"

# Java Remote Debug Enabled
if [ "YESX" == "${JAVA_DEBUG}" ] || [ "yesX" == "${JAVA_DEBUG}" ]; then
    JAVA_OPTS="${JAVA_OPTS} -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8888"
fi

export JAVA_OPTS

if [ `ls ${TOMCAT_HOME}/webapps/ | wc -l` -eq 0 ]; then
  echo "[`date`] [WARN ] None application found in ${TOMCAT_HOME}/webapps, Copy ROOT to it."
  \cp -rf ${TOMCAT_HOME}/backup/ROOT ${TOMCAT_HOME}/webapps/
fi

${TOMCAT_HOME}/bin/catalina.sh run "$@"
