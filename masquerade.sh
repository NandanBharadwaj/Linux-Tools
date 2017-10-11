#!/usr/bin/env bash
##############################################################################
# File:  port_farward.sh                                                     #
# Date: 22/Sep/2017                                                          #
# Author: Nandan Bharadwaj M R                                               #
# SCRIPT TO ADD MASQUERADE RULE                                              #
##############################################################################
IFACE=$1
SLEEP_TIME=2
SEARCH_STR="POSTROUTING -o $IFACE -j MASQUERADE"
if [ $# -eq 1 ] 
then
    sudo iptables -S -t nat | grep -e $SEARCH_STR
    if [ $? -ne 0 ]
    then
        sudo iptables -t nat -A POSTROUTING -o $IFACE -j MASQUERADE
        sleep $SLEEP_TIME
        sudo su -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
        sleep $SLEEP_TIME
    fi
else
    echo "Usage: $0 <NETWORK INTERFACE NAME>"
fi
