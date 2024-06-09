// mvp-database/shard-1/scripts/initiate-mongodb-shards.js
rs.initiate({
  _id: "shard1rs",
  members: [
    { _id: 0, host: "mongodb_shard_1_1:27017" },
    { _id: 1, host: "mongodb_shard_1_2:27017" },
    { _id: 2, host: "mongodb_shard_1_3:27017" },
  ],
});
