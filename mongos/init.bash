#!/bin/bash
# mvp-database/mongos/init.bash

docker-compose up -d

echo "Waiting for the MongoDB config servers and shards to be ready..."
until docker-compose exec mongos sh -c "mongosh --quiet --eval \"db.adminCommand('ping').ok\"" ; do
  sleep 5
done

echo "Running MongoDB setup scripts..."


docker-compose exec mongos sh -c "mongosh < /scripts/addShards.js"
docker-compose exec mongos sh -c "mongosh < /scripts/enableSharding.js" 

docker-compose exec mongos sh -c "mongosh < /scripts/setupCollection.js"

docker-compose exec mongos sh -c "mongosh < /scripts/createAdminUser.js"

echo "MongoDB setup complete!"