#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
imagename=udacity-ml
tagname=latest
dockeraccount=cbath
dockerpath=$dockeraccount/$imagename:$tagname
myapp=udacity-ml-app

# Step 2
# Run the Docker Hub container with kubernetes
#kubectl create deployment udacity-local --image=cbath/udacity-ml:latest
#kubectl run $myapp\
#    --image=$dockerpath\
#    --port=80 --labels app=$myapp

kubectl run $myapp --image=$imagename --port=80 --labels app=$myapp

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward $myapp 8000:80

kubectl get pods $myapp -o jsonpath='{.spec.containers[*].name}'
kubectl describe pod $myapp

