#!/bin/bash
set -e

# Stop the running container (if any)
echo "HI"
containerid=`docker ps | awk -F " " '{print $1}'`
docker rm -f $containerid
