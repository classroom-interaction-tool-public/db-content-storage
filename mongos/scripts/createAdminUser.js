// mvp-database/mongos/scripts/createAdminUser.js
db = db.getSiblingDB("admin");

db.createUser({
  user: "adminuser",
  pwd: "password",
  roles: [
    {
      role: "root",
      db: "admin",
    },
  ],
});
