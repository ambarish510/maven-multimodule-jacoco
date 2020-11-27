#!/bin/bash

if [ $# -ne 3 ]
then
  echo "Incorrect arguments"
  echo "Usage: makedeb.sh debDirectory sourceJarPath debFileName"
  exit 1;
fi
#Expects the repo to be built and the jar available at ./target/buildinfra-demo-sq-java-mvn-1.0-SNAPSHOT.jar

sourceJar=$2
debDirectory=$1
#sourceConfig="target/classes/getjira.yml"
destDir="$debDirectory/usr/share/fk-build-demo"
debFile=$3

rm -f $debFile
rm -rf $destDir
mkdir -p $destDir

if [ ! -f $sourceJar ]; then
    echo "jar file not found! do mvn package"
    exit 1
else
    cp $sourceJar $destDir
fi
#if [ ! -f $sourceConfig ]; then
#    echo "$sourceConfig not found! pull from git repo and try again"
#    exit 1
#else
#    cp $sourceConfig $destDir
#fi

dpkg-deb -b $debDirectory $debFile

if [ ! -f $debFile ]; then
    echo "Debian package not created!"
    exit 1
fi

echo "Debian package created!"
exit 0
