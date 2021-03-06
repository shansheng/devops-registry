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
    # YES/yes | NO/no
    # CRACKED_MODE=NO

VOLUME ${JIRA_HOME}

EXPOSE ${JIRA_PORT}

# https://downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-7.3.1.tar.gz
# .tar, .tar.gz
ADD resources/jira.tar* /opt/

# https://confluence.atlassian.com/adminjiraserver073/connecting-jira-applications-to-mysql-861253043.html
ADD resources/dbconfig.xml ${JIRA_APP}/templates/dbconfig.xml

# ADD resources/license/atlassian-extras-3.2.jar ${JIRA_APP}/backup/atlassian-extras-3.2.patch.jar

ADD resources/entrypoint.sh /opt/entrypoint.sh

RUN chmod +x /opt/entrypoint.sh \
    && \rm -rf /opt/jirasoftware_home
    # && \cp -f ${JIRA_APP}/atlassian-jira/WEB-INF/lib/atlassian-extras-3.2.jar ${JIRA_APP}/backup/atlassian-extras-3.2.jar

ENTRYPOINT [ "/bin/sh", "-c", "/opt/entrypoint.sh" ]
