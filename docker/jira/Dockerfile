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
    JIRA_PORT=8090 \
    JAVA_VM_MEM_MIN=512 \
    JAVA_VM_MEM_MAX=1024

VOLUME /opt/jirasoftware-home/data/attachments \
    /opt/jirasoftware-home/log \
    /opt/jirasoftware-home/export \
    /opt/jirasoftware-home/caches

# .tar, .tar.gz
ADD resources/jira.tar* /opt/

ADD resources/jira-application.properties ${JIRA_APP}/atlassian-jira/WEB-INF/classes/jira-application.properties

EXPOSE ${JIRA_PORT}

ADD resources/entrypoint.sh /opt/entrypoint.sh

RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT [ "/bin/sh", "-c", "/opt/entrypoint.sh" ]
