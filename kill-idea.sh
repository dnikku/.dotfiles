#!/bin/bash

IDEA_PIDS=$(ps aux | grep ideaIU/jbr/bin/java | grep -v grep | awk '{printf "%s ", $2}')

if [[ "$IDEA_PIDS" != "" ]]; then
  echo "Killing idea PID=$IDEA_PIDS"
  kill -9 $IDEA_PIDS
else
  echo "Idea not started."
fi

