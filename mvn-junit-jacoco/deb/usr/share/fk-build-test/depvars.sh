#!/bin/bash

export PACKAGE=fk-build-test
export USER=$PACKAGE
export LOG_DIR=/var/log/flipkart/fk-build-test
export DEBUG_PORT=11004
export JMX_PORT=11003
export ADMIN_PORT=11005
export PID_FILE=/var/run/${PACKAGE}.pid
