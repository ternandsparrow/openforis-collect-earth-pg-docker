#!/bin/bash
# Restore the specified dump to the DB running in the docker container.
# We assume you created the dump with the backup-db.sh script.
# Usage:
#   ./restore-db.sh some.dump
# note: this is a bit brittle in that we don't read the .env file
cd `dirname "$0"`
set -e
inName=$1
if [ -z "$inName" ]; then
  echo "[ERROR] no input name supplied"
  echo "usage: $0 <dump-path>"
  echo "   eg: $0 opencollect.20180829_2325.backup"
  exit 1
fi
extraPgParams=$2
echo "You may be prompted for the postgres password:"
echo "DROP DATABASE IF EXISTS opencollect; CREATE DATABASE opencollect;" | psql \
  --username=opencollect \
  --host=localhost \
  --dbname=postgres \
  -v ON_ERROR_STOP=1 \
  $extraPgParams

pg_restore \
  --username=opencollect \
  --host=localhost \
  --dbname=opencollect \
  $extraPgParams \
  $inName

