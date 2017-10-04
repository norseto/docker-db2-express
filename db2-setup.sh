#!/bin/sh

# starts db2
echo "Starting DB2..."
db2start

# determine first time execution.
db2 list db directory
stat=$?

if [ $stat -ne 0 ] ; then
  # run the setup script to create the DB and the schema in the DB
  for file in /docker-entrypoint-initdb.d/*
  do
    case $file in
    *.sh)  /bin/sh $file;;
    *.sql) db2 -tvf $file;;
    *)     echo "Skipped: $file";;
    esac
  done
fi

db2stop force
echo "Database initialize done. Enjoy! ;)"

