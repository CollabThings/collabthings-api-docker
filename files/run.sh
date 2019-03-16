#!/bin/bash

cd /opt

#echo run-ipfs
#bash run-ipfs.sh &

echo collabthings-api
cd /opt/project


echo "***** RUN API **********"
node main.js
echo "***** RUN API DONE **********"


