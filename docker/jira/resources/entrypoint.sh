#!/bin/bash

#
# Copyright (c) 2001-2018 Primeton Technologies, Ltd.
# All rights reserved.
#
# author: ZhongWen Li (mailto:lizw@primeton.com)
#

if [ -z ${JIRA_APP} ]; then
  echo "[ERROR] Environment variable JIRA_APP not defined."
  exit 1
fi

if [ ! -d ${JIRA_APP} ]; then
  echo "[ERROR] ${JIRA_APP} not exists."
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

# Use setenv.sh
# JAVA_OPTS="${JAVA_OPTS} -Xms${JAVA_VM_MEM_MIN}m -Xmx${JAVA_VM_MEM_MAX}m"
JAVA_OPTS="${JAVA_OPTS} -Dfile.encoding=utf-8 -Duser.timezone=Asia/Shanghai"
export JAVA_OPTS

if [ -f ${JIRA_APP}/bin/setenv.sh ]; then
  sed -i -e "s/768m/${JAVA_VM_MEM_MAX}m/g"  ${JIRA_APP}/bin/setenv.sh
  sed -i -e "s/384m/${JAVA_VM_MEM_MIN}m/g"  ${JIRA_APP}/bin/setenv.sh
else
  JAVA_OPTS="${JAVA_OPTS} -Xms${JAVA_VM_MEM_MIN}m -Xmx${JAVA_VM_MEM_MAX}m"
fi

if [ -x "${JIRA_APP}/bin/catalina.sh" ]; then
  ${JIRA_APP}/bin/catalina.sh run
else
  /bin/sh ${JIRA_APP}/bin/catalina.sh run
fi