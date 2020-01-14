#!/bin/bash

username=$(whoami)

docker build \
    --build-arg username="$username" \
    --rm -f "Dockerfile" \
    -t intellij-docker:latest .