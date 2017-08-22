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

if [ -x "${JIRA_APP}/bin/catalina.sh" ]; then
  ${JIRA_APP}/bin/catalina.sh run
else
  /bin/sh ${JIRA_APP}/bin/catalina.sh run
fi