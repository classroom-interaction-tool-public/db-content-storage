#!/bin/bash
# mvp-database/shard-1/init.bash

docker-compose up -d

echo "Waiting for the MongoDB shard instance 1_1 to be ready..."
until docker-compose exec mongodb_shard_1_1 sh -c "mongosh --eval \"db.runCommand({ ping: 1 })\""; do
    sleep 3
done

echo "Waiting for the MongoDB shard instance 1_2 to be ready..."
until docker-compose exec mongodb_shard_1_2 sh -c "mongosh --eval \"db.runCommand({ ping: 1 })\""; do
    sleep 3
done

echo "Waiting for the MongoDB shard instance 1_3 to be ready..."
until docker-compose exec mongodb_shard_1_3 sh -c "mongosh --eval \"db.runCommand({ ping: 1 })\""; do
    sleep 3
done

returnValue=$(docker-compose exec mongodb_shard_1_1 sh -c "mongosh < /scripts/initiate-mongodb-shards.js")
echo $returnValue
