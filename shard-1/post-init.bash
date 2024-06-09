docker-compose up -d

echo "Waiting for the MongoDB shard instances to be ready..."
until docker-compose exec mongodb_shard_1_1 sh -c "mongosh --authenticationDatabase admin -u adminuser -p 'password' --eval \"db.runCommand({ ping: 1 })\""; do
    sleep 3
done