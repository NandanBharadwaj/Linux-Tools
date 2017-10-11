#!/usr/bin/env bash
##############################################################################
# File:  rename_iface.sh                                                     #
# Date: 22/Sep/2017                                                          #
# Author: Nandan Bharadwaj M R                                               #
# SCRIPT TO CHANGE THE NETWORK INTERFACE NAME                                #
##############################################################################
OLD_NAME=$1
NEW_NAME=$2
SLEEP_TIME=5
if [ $# -eq 2 ] 
then
    ifconfig $1 down
    sleep $SLEEP_TIME
    ip link set $OLD_NAME name $NEW_NAME
    sleep $SLEEP_TIME
    ifconfig $NEW_NAME up
    sleep $SLEEP_TIME
else
    echo "Usage: $0 <interface name to be changed> <new name of the interface>"
fi
