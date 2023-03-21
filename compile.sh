#!/bin/sh

PROJECT_NAME="cv"
VERSION="v0"
RET=$(docker images | awk '{print $1}' | grep -x "$PROJECT_NAME")

if [ "$RET" = "" ]; then
  echo "building ${PROJECT_NAME} ..."

  docker image build -t "${PROJECT_NAME}":"$VERSION"
fi

docker container run \
  -v "$(pwd)/src:/$PROJECT_NAME" \
  --rm \
  --name "$PROJECT_NAME" \
  "$PROJECT_NAME":"$VERSION"
