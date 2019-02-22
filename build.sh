#!/bin/bash

if [ ! -f files/ipfs.tgz ]; then
	curl https://dist.ipfs.io/go-ipfs/v0.4.18/go-ipfs_v0.4.18_linux-amd64.tar.gz -o files/ipfs.tgz
fi

yes | rm -r tmp

mkdir -p tmp/collabthings-api
if [ -d ../collabthings-api ]; then
	rsync -avz --exclude 'node_modules' --exclude '.git' ../collabthings-api tmp/
else
	echo getting collabthings-api with git
	cd tmp && git clone https://github.com/CollabThings/collabthings-api.git
fi

docker build . -t jeukku/ct-api

