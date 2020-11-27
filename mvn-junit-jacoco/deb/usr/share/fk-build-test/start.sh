#!/bin/bash

. /usr/share/$PACKAGE/prepare_runtime.sh

echo "Starting service: $PACKAGE"
echo "sudo -u $USER $JAVA_HOME/jre/bin/java $JAVA_OPTS -jar $CLASSPATH --spring.config.location=file:/etc/$PACKAGE/build-metrics-collector.properties"
sudo -u $USER $JAVA_HOME/jre/bin/java $JAVA_OPTS -jar $CLASSPATH --spring.config.location=file:/etc/$PACKAGE/build-metrics-collector.properties 2>$ERROR_FILE 1>$OUT_FILE &
echo $!>$PID_FILE

pid=`cat $PID_FILE`
echo "Service started ($pid)"
