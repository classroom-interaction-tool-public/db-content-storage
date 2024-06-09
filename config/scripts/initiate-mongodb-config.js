// mvp-database/config/scripts/initiate-mongodb-config.js
rs.initiate({
  _id: "cfgrs",
  configsvr: true,
  members: [
    { _id: 0, host: "mongodb_config_1:27017" },
    { _id: 1, host: "mongodb_config_2:27017" },
    { _id: 2, host: "mongodb_config_3:27017" },
  ],
});
