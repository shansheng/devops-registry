#
# Copyright (c) 2001-2018 Primeton Technologies, Ltd.
# All rights reserved.
#
# author: ZhongWen Li (mailto:lizw@primeton.com)
#

FROM centos:7

LABEL maintainer="lizw@primeton.com" \
    provider="Primeton Technologies, Ltd."

ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8"

ENV JAVA_VERSION="1.8.0_102"

ENV JAVA_HOME="/usr/local/jdk${JAVA_VERSION}"

ENV JRE_HOME=${JAVA_HOME}

ENV PATH="${PATH}:${JAVA_HOME}/bin"

# ADD resources/server-jre*.tar.gz /usr/local/

# Do not use alias cp
RUN \cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && yum update -y \
    && yum install -y unzip tar curl wget \
    && echo "alias l='ls -al'" >> /root/.bashrc

RUN wget --tries=3 \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/server-jre-8u144-linux-x64.tar.gz \
        -O /tmp/jre.tar.gz \
    && tar -zxf /tmp/jre.tar.gz -C /usr/local/ \
    && \rm -f /tmp/jre.tar.gz ${JAVA_HOME}/src.zip ${JAVA_HOME}/javafx-src.zip
