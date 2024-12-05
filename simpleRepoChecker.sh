#!/bin/bash

# Define your image
IMAGE="bureaudescons/nuit_info_repo:latest"

# Get the latest image hash from the Docker registry
latest_hash=$(curl -s https://registry.hub.docker.com/v2/repositories/bureaudescons/nuit_info_repo/tags/latest | jq -r '.images[0].digest')

# Get the local image digest and remove the repository prefix
local_hash=$(docker inspect --format '{{index .RepoDigests 0}}' $IMAGE | sed 's/^.*@//')

if [ "$latest_hash" != "$local_hash" ]; then
    echo "New image found, updating..."
  #  docker-compose down &&
  #  docker-compose pull && docker-compose up -d
else
    echo "No new image."
fi
