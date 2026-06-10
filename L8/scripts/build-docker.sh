#!/bin/bash

cd "$(dirname "$0")/docker"
docker build -t mynginx:latest .

docker tag mynginx:latest 103549976630.dkr.ecr.us-east-1.amazonaws.com/mynginx:latest
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 103549976630.dkr.ecr.us-east-1.amazonaws.com
docker push 103549976630.dkr.ecr.us-east-1.amazonaws.com/mynginx:latest