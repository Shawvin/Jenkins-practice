#!/bin/bash

echo "*********************************"
echo "** Building jar *****************"
echo "*********************************"

docker run --rm -v $PWD/java-app:/app -v /root/.m2:/root/.m2 -w /app maven:3.8.6-jdk-11 "$@"

