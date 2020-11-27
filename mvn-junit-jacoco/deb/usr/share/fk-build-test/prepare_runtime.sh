#!/bin/bash

[ -s $PID_FILE ] && echo "Process is already running with ID `cat $PID_FILE`" && exit 2

JAVA_HOME="/usr/lib/jvm/jdk-8-oracle-x64"
if [ ! -d "$JAVA_HOME" ]; then
  log_failure_msg "JDK not found !!!"
  exit 1
fi

echo "JAVA_HOME: $JAVA_HOME"

JAVA_OPTS="-XX:+UnlockCommercialFeatures -XX:+FlightRecorder -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=$JMX_PORT -Xmx1G -Xms1G -Xmn512M -XX:+UseG1GC -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp/$PACKAGE-heap.bin -Xloggc:$LOG_DIR/`date +%Y_%m_%d-%H%M_gc`.log -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=$DEBUG_PORT"

echo "JAVA_OPTS: $JAVA_OPTS"

set CLASSPATH
CLASSPATH=$(find /usr/share/$PACKAGE/lib -name '*.jar' | xargs -I % echo -n "%")
#CLASSPATH=/etc/$PACKAGE$CLASSPATH
echo "CLASSPATH: $CLASSPATH"

OUT_FILE=$LOG_DIR/${PACKAGE}.out
ERROR_FILE=$LOG_DIR/${PACKAGE}.err
