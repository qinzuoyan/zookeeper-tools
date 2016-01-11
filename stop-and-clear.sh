#!/bin/bash

./stop.sh

sleep 2

rm -rf $ZOOKEEPER_HOME/data
echo "Cleared"

