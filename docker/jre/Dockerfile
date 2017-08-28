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

ADD resources/server-jre*.tar.gz /usr/local/

# Do not use alias cp
RUN \cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && yum update -y \
    && yum install -y unzip tar curl
