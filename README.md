# demodb-docker

Run a postgres instance in Docker and initially load the flight demo database:

```sh
docker compose up -d
docker compose logs -f
```

Now connect to the database on localhost using the port and credentials from the `.env` file.

Stop and remove postgres and persistent files of the database:

```sh
docker compose down
rm -rf volumes/postgres/*
```

If changing only the init scripts, build without using cache:

```sh
docker compose build --no-cache
```

## Configuration

```sh
# path of config file in container
pgconf=/var/lib/postgresql/data/postgresql.conf
# get id of postgres container
cid=$(docker ps | grep demodb-docker-postgres | awk '{print $1}')
# view full config
docker exec $cid cat $pgconf
# configure pg_stat_statements and logs
docker exec $cid sed -i "/#shared_preload_libraries = '' # (change requires restart)/c\shared_preload_libraries = 'pg_stat_statements'" $pgconf
docker exec $cid sed -i "/#log_destination = 'stderr'/c\log_destination = 'csvlog'" $pgconf
docker exec $cid sed -i "/#logging_collector = off/c\logging_collector = on" $pgconf
docker exec $cid sed -i "/#log_filename = 'postgresql-%Y-%m-%d_%H%M%S.log'/c\log_filename = 'postgresql.log'" $pgconf
# verify config with only values that are set
docker exec $cid egrep -v "^[[:blank:]]*($|#|//|/\*| \*|\*/)" $pgconf
# restart to apply config changes
docker restart $cid
```

## References

- [postgres](https://www.postgresql.org)
- [docker compose](https://docs.docker.com/compose/)
- [demodb](https://postgrespro.com/community/demodb)
