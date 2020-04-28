#!/bin/bash
# triggers a backup job (outside cron) in the docker container
set -euxo pipefail
docker exec -it collectearth-pgbackups3 sh /backup.sh
