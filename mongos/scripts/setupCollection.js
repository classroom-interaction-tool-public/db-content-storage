db = db.getSiblingDB("citdb");

// Sessions
db.createCollection("sessions");
db.sessions.createIndex({ sessionCode: 1 });
db.sessions.createIndex({ ownerId: 1 });
db.sessions.createIndex({ sessionCode: 1, ownerId: 1 });
sh.shardCollection("citdb.sessions", { _id: "hashed" });

// Answers
db.createCollection("answers");
db.answers.createIndex({ ownerId: 1, _id: 1 });
db.answers.createIndex({ questionId: 1 });
db.answers.createIndex({ sessionId: 1 });
sh.shardCollection("citdb.answers", { _id: "hashed" });

// Questions
db.createCollection("questions");
sh.shardCollection("citdb.questions", { _id: "hashed" });

// QuestionCollections
db.createCollection("questioncollections");
db.questioncollections.createIndex({ ownerId: 1 });
sh.shardCollection("citdb.questioncollections", { _id: "hashed" });

db.createCollection("users");
db.users.createIndex({ email: 1 });
sh.shardCollection("citdb.users", { _id: "hashed" });
