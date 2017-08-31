#
# Copyright (c) 2001-2018 Primeton Technologies, Ltd.
# All rights reserved.
#
# author: ZhongWen Li (mailto:lizw@primeton.com)
#

FROM harbor.registry.com/primeton/jdk:1.8

# LABEL maintainer="lizw@primeton.com" \
#     provider="Primeton Technologies, Ltd."

ENV JIRA_VERSION=7.3.1 \
    JIRA_APP=/opt/jira-7.3.1 \
    JIRA_HOME=/opt/jira_home \
    JIRA_PORT=8090 \
    JAVA_VM_MEM_MIN=512 \   
    JAVA_VM_MEM_MAX=1024 \
    MYSQL_DATABASE=jira \
    MYSQL_USER=jira \
    MYSQL_PASSWORD=jira \
    MYSQL_HOST=mysql \
    MYSQL_PORT=3306

VOLUME /opt/jira_home/data/attachments \
    /opt/jira_home/log \
    /opt/jira_home/export \
    /opt/jira_home/caches

# https://downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-7.3.1.tar.gz
# .tar, .tar.gz
ADD resources/jira.tar* /opt/

# https://confluence.atlassian.com/adminjiraserver073/connecting-jira-applications-to-mysql-861253043.html
ADD resources/dbconfig.xml ${JIRA_APP}/templates/dbconfig.xml

EXPOSE ${JIRA_PORT}

ADD resources/entrypoint.sh /opt/entrypoint.sh

RUN chmod +x /opt/entrypoint.sh \
    && \rm -rf /opt/jirasoftware_home

ENTRYPOINT [ "/bin/sh", "-c", "/opt/entrypoint.sh" ]
