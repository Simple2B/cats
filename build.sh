#!/bin/bash

#get version
VERSION=$(poetry version -s)

# Build docker image for AMD64 and ARM64
docker buildx build --platform linux/amd64 -t simple2b/cats:latest -t simple2b/cats:${VERSION} --push .
# docker buildx build --platform linux/arm64 -t simple2b/cats:latest -t simple2b/cats:${VERSION} --push .
