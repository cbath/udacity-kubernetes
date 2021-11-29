#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
imagename=udacity-ml
tagname=latest
dockeraccount=cbath
dockerpath=$dockeraccount/$imagename:$tagname

# Step 2:  
# Authenticate
echo "Logging into Docker Account: $dockeraccount"
cat secrets/docker_password.txt | docker login --username $dockeraccount --password-stdin

# Tag Image
echo "Tagging Image: $imagename:$tagname as $dockerpath"
docker tag $imagename:$tagname $dockerpath

# Step 3:
# Push image to a docker repository
echo "Uploading Images: $dockerpath"
docker push $dockerpath
