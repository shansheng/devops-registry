#!/bin/bash

#
# Copyright (c) 2001-2018 Primeton Technologies, Ltd.
# All rights reserved.
#
# author: ZhongWen Li (mailto:lizw@primeton.com)
#

BASE_DIR=$(cd `dirname $0`; pwd)

if [ ! -f ${BASE_DIR}/jenkins.war ]; then
    echo "${BASE_DIR}/jenkins.war not found."
    exit 1
fi
# port
if [ -z "${JENKINS_PORT}" ]; then
  JENKINS_PORT=8080
fi

# workspace
if [ -z ${JENKINS_HOME} ]; then
  JENKINS_HOME=${BASE_DIR}/work
fi
if [ ! -d ${JENKINS_HOME} ]; then
  mkdir ${JENKINS_HOME}
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

JAVA_OPTS="${JAVA_OPTS} -Dfile.encoding=utf-8 -Duser.timezone=Asia/Shanghai"
JAVA_OPTS="${JAVA_OPTS} -Xmx${JAVA_VM_MEM_MAX}m -Xms${JAVA_VM_MEM_MIN}m -DJENKINS_HOME=${JENKINS_HOME}"

java ${JAVA_OPTS} -jar ${BASE_DIR}/jenkins.war --httpPort=${JENKINS_PORT}
