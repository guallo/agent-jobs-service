#!/usr/bin/env bash

DOCKER_IMAGE="django-manage:latest"

format="{{.Repository}}"
if [[ "$DOCKER_IMAGE" == *:* ]]; then
    format="$format:{{.Tag}}"
fi

if ! docker images --format "$format" | grep -P "^.{${#DOCKER_IMAGE}}$" \
    | grep -qF "$DOCKER_IMAGE"; then
    pushd "$(dirname "$(realpath "$BASH_SOURCE")")" 2> /dev/null
    docker build -t "$DOCKER_IMAGE" .
    popd 2> /dev/null
fi

container="$(echo "$DOCKER_IMAGE" | tr -d -c "[:alpha:][:digit:]")-container"
exec docker run --name "$container" --rm -it --network=host \
    "$DOCKER_IMAGE" "$@"
