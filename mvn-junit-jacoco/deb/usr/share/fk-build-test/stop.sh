#!/bin/bash

function grace_kill() {
  local_pid=$1
  if ps -p $local_pid > /dev/null;
  then
    echo "Will SIGTERM PID: $local_pid."
    kill -15 $local_pid
  fi
  retry=0
  max_retry=20
  while [ $retry -lt $max_retry ] && ps -p $local_pid > /dev/null;
  do
    sleep 0.5
    retry=$((retry + 1))
  done
  if ps -p $local_pid > /dev/null;
  then
    echo "SIGTERM on PID: $local_pid did not stop. Will SIGKILL the service."
    kill -9 $local_pid
  fi
}

if [ -f $PID_FILE ];
then
  pid=`cat $PID_FILE`
  echo "Stopping service: $PACKAGE, PID: $pid"
  grace_kill $pid
  rm -f $PID_FILE
  echo "Successfully stopped service: $PACKAGE"
fi
