#!/bin/bash
# mvp-database/init.bash

mongo_shared_network_name="mongo-shared-network"


if ! docker network ls | grep -q $mongo_shared_network_name; then
  echo "Network $mongo_shared_network_name exist. Creating..."
  docker network create $mongo_shared_network_name
else
  echo "Network $mongo_shared_network_name already exists. Skipping creation."
fi

cd ./config && ./init.bash && cd ../ &&
cd ./shard-1 && ./init.bash && cd ../ &&
cd ./shard-2 && ./init.bash && cd ../ &&
cd ./shard-3 && ./init.bash && cd ../ &&
cd ./mongos && ./init.bash && cd ../
