# dbs1-testat

This Repository contains the Files for the Testat of the Module DBS1. 

Authors: Laurin Fürer, Eric Merz

## Use

To create a postgres db with docker compose first create a .env

```.env
POSTGRES_PASSWORD=change_this_to_a_strong_password
```
Then run the following command:

```sh
docker compose up -d
```

connect using psql
```sh
psql -U appuser -d appdb
```
