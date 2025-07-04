## KORRAST DATABASE

Database related script for the korrast project

### What can you find

- `Init.sql` -> script that init korrast db schemas
- `docker-compose.yaml` -> docker compose script that create instance of the korras-db using docker container

### How to use

run the following to start the db :

```bash
docker compose up -d
```

run the following to interract with the db using psql command line :

```bash
docker exec -it postgres-db psql -U korrast-dev -d korrast-db
```
