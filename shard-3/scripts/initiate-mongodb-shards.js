// mvp-database/shard-3/scripts/initiate-mongodb-shards.js
rs.initiate({
  _id: "shard3rs",
  members: [
    { _id: 0, host: "mongodb_shard_3_1:27017" },
    { _id: 1, host: "mongodb_shard_3_2:27017" },
    { _id: 2, host: "mongodb_shard_3_3:27017" },
  ],
});
