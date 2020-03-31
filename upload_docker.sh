#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=hatwithpins/udacity

# Step 2:  
# Authenticate & tag
echo "Type your Docker password:"
read -s PASSWORD
docker login -u hatwithpins -p $PASSWORD
docker tag d5b80bc5c8cb hatwithpins/udacity:latest
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push hatwithpins/udacity:latest
