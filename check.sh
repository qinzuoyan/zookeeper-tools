#!/bin/bash

PORT=`cat port`

netstat -na | grep $PORT

echo stat | nc $HOSTNAME $PORT

