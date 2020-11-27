#!/bin/bash

if [ -f $PID_FILE ];
then
  pid=`cat $PID_FILE`
  if ps -p $pid > /dev/null;
  then
    echo "running ($pid)"
  else
    echo "error (run cleanup)"
  fi
else
  echo "stopped"
fi
