# Readme

# Usage

```bash
$ docker stack deploy -c docker-compose.yml stack1
$
$ # View deployment
$ docker service ps stack1
$
$ docker service ls
$
$ # Remove service
$ docker service rm stack1_devops
$
$ # Clean all
$ docker service rm $(docker service ls -q)
```