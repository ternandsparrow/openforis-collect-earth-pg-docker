See
[here](http://www.openforis.org/support/questions/17/how-do-you-setup-collect-earth-in-postgresql-mode)
for what we're setting up.


## Tools required:
  - Docker >= 18.03.x
  - docker-compose >= 1.25.x

## Quick steps to get started with the service

  1. create a new VM
  1. install `docker` and `docker-compose`
  1. clone this repo onto the VM
  1. copy `example.env` to `.env`
  1. edit `.env` to add the required details
  1. spin up the compose stack by executing: `docker-compose up -d`
  1. you can now connect to the DB on `5432`

## Detailed commands

Trigger adhoc PG backup to S3:
```bash
./trigger-backup-in-container.sh
```

To start the service, or to update after making changes to `docker-compose.yml`:

```bash
docker-compose up --detach # or simply
```

To stop the stack, but **leave the DB data volume alone**:

```bash
docker-compose down
# from here you can run the `up` command to start the stack again, and it'll pick up the existing DB data volume
```

To completely **remove all traces, including the DB data**, use:

```bash
docker-compose down --volumes # the --volumes flag nukes the volumes too
```

View the volume:

```bash
# list all volumes
docker volume ls
docker volume inspect openforis-collect-earth-pg-docker_pgdata
```
