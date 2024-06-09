# CIT - Database

## Getting Started

To start the sharded Mongo Database using Docker, make sure you have installed [Docker](https://www.docker.com/) first. After Docker is up and running, `cd` into the `mvp-database` directory with your favorite command line tool that can run bash scripts and execute the following command:

```bash
./init.bash
```

Wait for a bit until the Docker containers have been properly initiated and the Mongo DB instances have finished linking to each other. When the process is complete, the database should be accessible at http://localhost:30000 by default unless modified in the `docker-compose.yml` file.

[Mongo DB Compass](https://www.mongodb.com/products/tools/compass) is a great UI tool that can be used to view the data that the database contains.

## Resetting the database

Sometimes there is a need to 'nuke' the database and all the Docker containers associated with it during testing. Therefore, a script called `reset.bash` has been created to facilitate this. Use this functionality with caution.
