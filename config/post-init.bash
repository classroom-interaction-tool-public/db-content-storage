# Step 1: Start the MongoDB config server
docker-compose up -d

# Step 2: Wait for the MongoDB config server to be ready
echo "Waiting for the MongoDB config server to be ready..."
until docker-compose exec mongodb_config_1 sh -c "mongosh --authenticationDatabase admin -u tomas -p 'hello' --eval \"db.runCommand({ ping: 1 })\""; do
    sleep 3
done