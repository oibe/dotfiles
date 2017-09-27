#!/bin/bash

ARG1=${1:-foo}


# print out commands as they are executed
set -v

# exit if any command fails
set -e

# fail if variables are not defined
set -u

if [ ! -d "../benchmarks/dist" ]; then
    # compile and copy es5 into benchmarks
    npm run compile
    cp -R ./dist/ ./benchmarks/dist
fi

if [ ! -f "../benchmarks/package.json" ]; then
    # copy package.json into benchmarks
    cp ./package.json ./benchmarks/package.json
fi

if (ussh appdocker62-sjc1 '[ -d ./benchmarks ]')
then
    echo "benchmarks exists!"
    rsync -avz ../benchmarks/flame_graph_loop.js appdocker62-sjc1:~/benchmarks
else
    echo "benchmarks does not exist!"
    rsync -avz ../benchmarks/ appdocker62-sjc1:~/benchmarks
fi

ussh appdocker62-sjc1 'bash -s' < generate_flame_graph.sh

# Generate svg file
rsync -avz appdocker62-sjc1:flame.raw .
cp flame.raw ./FlameGraph/flame.raw
./FlameGraph/stackcollapse-stap.pl ./FlameGraph/flame.raw | tr -d "\0" > ./FlameGraph/flame.folded
./FlameGraph/flamegraph.pl ./FlameGraph/flame.folded > ./flame.svg
