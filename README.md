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

## References

- [postgres](https://www.postgresql.org)
- [docker compose](https://docs.docker.com/compose/)
- [demodb](https://postgrespro.com/community/demodb)
