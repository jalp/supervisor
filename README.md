# Launching prana
Using netflix prana to launch a simple Flask application

## Run it
Previously, you must have installed [docker](https://docs.docker.com/installation/mac/)

```sh
$ docker-compose build && docker-compose up -d && docker-compose logs
```

## Access to logs
Firstly, you have to access to the docker machine

```sh
$ docker run -it supervisor_web /bin/bash
```
and then access to the logs (/var/log)