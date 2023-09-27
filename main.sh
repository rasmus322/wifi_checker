#!/bin/bash
con=$1
pass=$2

if [[ -z "$?" || "$1" == "-h" || "$1" == "--help" ]]; then
    echo "$0"
    echo "This is bash script that checks if you are connected to wifi network, and if not, auto-connects to it"
    exit 0
fi

if [[ -z $con ]]; then
    echo "Enter the name of your AP"
    exit 1
fi

while true; do
    echo "scanning networks..."
    nmcli device wifi rescan
    nmcli dev wifi connect $con password $pass
    sleep 5
done