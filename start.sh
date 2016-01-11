#!/bin/bash

if [ ! -f "port" ]; then
  echo "file port not exist"
  exit 1
fi

if [ ! -f "servers" ]; then
  echo "file servers not exist"
  exit 1
fi

if [ ! -f "myid" ]; then
  echo "file myid not exist"
  exit 1
fi

cp $ZOOKEEPER_HOME/conf/zoo_sample.cfg $ZOOKEEPER_HOME/conf/zoo.cfg

sed -i "s@dataDir=/tmp/zookeeper@dataDir=$ZOOKEEPER_HOME/data@" $ZOOKEEPER_HOME/conf/zoo.cfg

PORT=`cat port`
sed -i "s@clientPort=2181@clientPort=$PORT@" $ZOOKEEPER_HOME/conf/zoo.cfg

cat servers >>$ZOOKEEPER_HOME/conf/zoo.cfg

mkdir -p $ZOOKEEPER_HOME/data
cp myid $ZOOKEEPER_HOME/data/myid

$ZOOKEEPER_HOME/bin/zkServer.sh start

sleep 1

grep "exiting abnormally" zookeeper.out

