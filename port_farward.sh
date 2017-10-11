#!/usr/bin/env bash
##############################################################################
# File:  port_farward.sh                                                     #
# Date: 22/Sep/2017                                                          #
# Author: Nandan Bharadwaj M R                                               #
# SCRIPT TO ADD PORT FORWARDING RULES                                        #
##############################################################################
DESTINATION_IP=$1
FWD_IP=$2
PORT_NUM=$3
SLEEP_TIME=2
OUTPUT_SEARCH_STR="OUTPUT -d $DESTINATION_IP -p tcp --dport $PORT_NUM -j DNAT --to-destination $FWD_IP:$PORT_NUM"
PREROUTE_SEARCH_STR="PREROUTING -d $DESTINATION_IP -p tcp --dport $PORT_NUM -j DNAT --to-destination $FWD_IP:$PORT_NUM"
if [ $# -eq 3 ] 
then
    sudo iptables -S -t nat | grep -e $OUTPUT_SEARCH_STR
    if [ $? -ne 0 ]
    then
        sudo iptables -t nat -A OUTPUT -d $DESTINATION_IP -p tcp --dport $PORT_NUM -j DNAT --to-destination $FWD_IP:$PORT_NUM
        sleep $SLEEP_TIME
    fi
    sudo iptables -S -t nat | grep -e $PREROUTE_SEARCH_STR
    if [ $? -ne 0 ]
    then
        sudo iptables -t nat -A PREROUTING -d $DESTINATION_IP -p tcp --dport $PORT_NUM -j DNAT --to-destination $FWD_IP:$PORT_NUM
        sleep $SLEEP_TIME
    fi
else
    echo "Usage: $0 <DESTINATION IP OF THE PACKETS> <PACKET FORWADING IP> <DESTINATION PORT OF PACKETS>"
fi
