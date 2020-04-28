#!/bin/bash
# do a pg_dump
# note: this is a bit brittle in that we don't read the .env file
cd `dirname "$0"`
uniqueId=`date +%Y%m%d_%H%M`
outName=collectearth.$uniqueId.backup
echo "You may be prompted for the postgres password:"
pg_dump \
        --format=c \
        --username=opencollect \
        --host=localhost \
        opencollect > $outName
echo "Created backup at $outName"

