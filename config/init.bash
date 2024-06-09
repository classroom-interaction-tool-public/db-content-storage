#!/bin/bash
# mvp-database/config/init.bash

# Step 1: Start the MongoDB config server
docker-compose up -d

# Step 2: Wait for the MongoDB config server to be ready
echo "Waiting for the MongoDB config server to be ready..."
until docker-compose exec mongodb_config_1 sh -c "mongosh --eval \"db.runCommand({ ping: 1 })\""; do
    sleep 3
done

# Step 3: Initiate the MongoDB config server
returnValue=$(docker-compose exec mongodb_config_1 sh -c "mongosh < /scripts/initiate-mongodb-config.js")
echo $returnValue