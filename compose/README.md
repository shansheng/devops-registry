# Readme

# Usage

```bash
docker stack deploy -c docker-compose.yml stack1

# View deployment
docker service ps stack1

docker service ls

# Remove service
docker service rm stack1_devops

# Clean all
docker service rm $(docker service ls -q)

docker stack ls              # List all running applications on this Docker host
docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
docker stack services <appname>       # List the services associated with an app
docker stack ps <appname>   # List the running containers associated with an app
docker stack rm <appname>   # Tear down an application

```

# Volumes

```bash
VOLUME_ROOT=/data

mkdir -p ${VOLUME_ROOT}/devops/work
mkdir -p ${VOLUME_ROOT}/devops/license
mkdir -p ${VOLUME_ROOT}/mysql
mkdir -p ${VOLUME_ROOT}/sonar
mkdir -p ${VOLUME_ROOT}/nexus
mkdir -p ${VOLUME_ROOT}/jenkins/m2
mkdir -p ${VOLUME_ROOT}/jenkins/workspace
mkdir -p ${VOLUME_ROOT}/gitlab/config
mkdir -p ${VOLUME_ROOT}/gitlab/data
mkdir -p ${VOLUME_ROOT}/gitlab/logs
mkdir -p ${VOLUME_ROOT}/jira/attachments
mkdir -p ${VOLUME_ROOT}/jira/log
mkdir -p ${VOLUME_ROOT}/jira/export
mkdir -p ${VOLUME_ROOT}/jira/caches

chmod 777 -R ${VOLUME_ROOT}/*
```