#!/bin/bash

docker ps -a | tr -s ' ' | grep ct | cut -d' ' -f 1 | xargs -l1 docker kill 
docker ps -a | tr -s ' ' | grep ct | cut -d' ' -f 1 | xargs -l1 docker rm 

bash build.sh
