#!/bin/bash

# print out commands as they are executed
set -v

# exit if any command fails
set -e

# fail if variables are not defined
set -u

pushd benchmarks/

if [ ! -d "./node_modules" ]; then
    npm install
fi

node flame_graph_loop.js &

PID=$!
SECONDS=10

echo "pid"
echo "$PID"

echo "running profiler now..."
sudo nodebt $PID fullraw $SECONDS > flame.raw
mv flame.raw ..

popd

sleep $SECONDS

echo "killing process $PID ..."
kill -9 $PID
