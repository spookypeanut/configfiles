#!/bin/bash

PACKAGE=$1

OIFS="$IFS"
IFS=$'\n'

for show in $(cat ~/currentshows.txt ~/deptshows.txt); do
    SHOW=$(echo $show | tr -d ' ')
    #echo "_${SHOW}_"
    for line in $(listSoftware -show $SHOW -name $PACKAGE | sed 1d); do
        HOST=$(echo $line | awk '{print $1}')
        if [ "$HOST" == "" ]; then
            continue
        fi
        VERSION=$(echo $line | awk '{print $3}')
        if [ "$HOST" == "standalone" ]; then
            HOSTTEXT=""
        else
            HOSTTEXT="-hosted-by $HOST"
        fi
        echo "installSoftware -uninstall -show $SHOW -name $PACKAGE $HOSTTEXT -version $VERSION"
    done
done
