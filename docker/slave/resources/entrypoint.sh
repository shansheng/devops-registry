#!/bin/bash

#
# Copyright (c) 2001-2018 Primeton Technologies, Ltd.
# All rights reserved.
#
# author: ZhongWen Li (mailto:lizw@primeton.com)
#

BASE_DIR=$(cd `dirname $0`; pwd)

if [ -z "${SLAVE_RUNNABLE}" ]; then
  SLAVE_RUNNABLE=/usr/share/jenkins/slave.jar
fi
if [ ! -f ${SLAVE_RUNNABLE} ]; then
  echo "${SLAVE_RUNNABLE} not found."
  exit 1
fi

# workspace
if [ -z ${SLAVE_WORKDIR} ]; then
  SLAVE_WORKDIR=${BASE_DIR}/jenkins
fi
if [ ! -d ${SLAVE_WORKDIR} ]; then
  mkdir ${SLAVE_WORKDIR}
fi

if [ -z "${JAVA_VM_MEM_MIN}" ]; then
  JVM_MIN_MEM=512
fi
if [ -z "${JAVA_VM_MEM_MAX}" ]; then
  JVM_MAX_MEM=4096
fi
if [ ${JAVA_VM_MEM_MIN} -gt ${JAVA_VM_MEM_MAX} ]; then
  echo "[`date`] [WARN ] JAVA_VM_MEM_MIN is bigger than JAVA_VM_MEM_MAX"
  JAVA_VM_MEM_MAX=${JAVA_VM_MEM_MIN}
fi

# Maven settings.xml
SETTINGS_TEMPLATE_FILE="/opt/template/maven/settings.xml"
if [ -f ${SETTINGS_TEMPLATE_FILE} ]; then
  echo "[`date`] [INFO ] Override copy maven settings template file ${SETTINGS_TEMPLATE_FILE} to ${MAVEN_HOME}/conf/settings.xml."
  # do not use cp alias
  \cp -f ${SETTINGS_TEMPLATE_FILE} ${MAVEN_HOME}/conf/settings.xml
else
  echo "[`date`] [WARN ] Maven settings template file ${SETTINGS_TEMPLATE_FILE} not found, then use default settings."
fi

JAVA_OPTS="${JAVA_OPTS} -Dfile.encoding=utf-8 -Duser.timezone=Asia/Shanghai"
JAVA_OPTS="${JAVA_OPTS} -Xmx${JAVA_VM_MEM_MAX}m -Xms${JAVA_VM_MEM_MIN}m"

echo "java ${JAVA_OPTS} -jar ${SLAVE_RUNNABLE} $@"

java ${JAVA_OPTS} -jar ${SLAVE_RUNNABLE} -workDir ${SLAVE_WORKDIR} "$@"
