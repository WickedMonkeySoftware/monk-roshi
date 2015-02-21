#!/bin/bash

HANDLER_DIR=/vagrant/monk

if [ "$SERF_EVENT" = "user" ]; then
    EVENT="user-$SERF_USER_EVENT"
elif [ "$SERF_EVENT" = "query" ]; then
    EVENT="query-$SERF_QUERY_NAME"
else
    EVENT=$SERF_EVENT
fi

echo "starting"
HANDLER="cd $HANDLER_DIR && mcli $EVENT"
$HANDLER
echo "leaving"