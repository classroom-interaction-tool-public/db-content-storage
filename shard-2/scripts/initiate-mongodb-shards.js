// mvp-database/shard-2/scripts/initiate-mongodb-shards.js
rs.initiate({
  _id: "shard2rs",
  members: [
    { _id: 0, host: "mongodb_shard_2_1:27017" },
    { _id: 1, host: "mongodb_shard_2_2:27017" },
    { _id: 2, host: "mongodb_shard_2_3:27017" },
  ],
});
