#!/usr/bin/env bash

function run {
  start_app
}

function build {
  # sudo docker build . -t rails-mysql-test-app
  # docker rmi app:latest
  docker build --rm -t app:latest .
}

function start_app {
  VOLUME_FOLDER=/tmp/docker/
  VOLUME=/volume

  docker run \
    -v $VOLUME_FOLDER:$VOLUME \
    -it --rm \
    -p 3000:3000 \
    app:latest
}

function start_redis {
  docker run \
    --name redis \
    --rm -d \
    -p 6379:6379 \
    redis:5.0.7
}

$@
