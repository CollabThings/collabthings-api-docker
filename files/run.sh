#!/bin/bash

cd /opt

echo run-ipfs
bash run-ipfs.sh &

echo collabthings-api
cd /opt/project

#echo npm install
#npm install

ssb-server start &
sleep 5

#echo "**** IFPS PEERS ********"
#ipfs swarm peers


echo "***** RUN API **********"
node main.js
echo "***** RUN API DONE **********"


