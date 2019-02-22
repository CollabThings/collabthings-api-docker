#!/bin/bash

cd /opt/go-ipfs
pwd
./ipfs init
./ipfs daemon &

sleep 4

echo ./ipfs cat

#./ipfs cat /ipfs/QmcgrkAqDnnDWmugwFiXAri9ZYcTzuWwDTFhYrrr3mcYgY





