docker-compose up -d

echo "Waiting for the MongoDB config server to be ready..."
until docker-compose exec mongos sh -c "mongosh --authenticationDatabase admin -u adminuser -p 'password' --eval \"db.runCommand({ ping: 1 })\""; do
    sleep 3
done