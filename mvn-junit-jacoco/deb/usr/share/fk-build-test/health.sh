#!/bin/bash

curl http://localhost:$ADMIN_PORT/healthcheck?pretty=true && echo""
