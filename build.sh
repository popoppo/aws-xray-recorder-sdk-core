#!/bin/bash

if [[ ! $(which gladle) ]]; then
   echo "gradle needs to be installed. Run aws-xray-sdk-java/gradlew"
   exit 1
fi

cd aws-xray-sdk-java

# Some tricks needed to run compileJava under submodule
mv .git dot.git
ln -s ../.git/modules/aws-xray-sdk-java .git

echo "Cleanup"
gradle clean

echo "Compiling ..."
gradle compileJava
cd aws-xray-recorder-sdk-core

echo "Creating new jar"
gradle jar
cd ../..
rm -rf classes/*
unzip aws-xray-sdk-java/aws-xray-recorder-sdk-core/build/libs/*.jar -d classes
rm -rf classes/META-INF/
lein uberjar
lein pom

# Restore .git
cd aws-xray-sdk-java
unlink .git
mv dot.git .git

echo "Done"
