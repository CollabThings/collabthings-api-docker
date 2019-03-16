bash rebuild.sh

docker network create -d bridge test-net

docker run  --name ct-api1 -p 14882:14881 --network=test-net jeukku/ct-api:latest &
docker run  --name ct-api2 -p 14883:14881 --network=test-net jeukku/ct-api:latest 

#sleep 30




