#!/usr/bin/env bash
##############################################################################
# File:  port_farward.sh                                                     #
# Date: 10/Oct/2017                                                          #
# Author: Nandan Bharadwaj M R                                               #
# SCRIPT TO RENAME THE LINUX USER                                            #
##############################################################################
OLD_USER=$1
NEW_USER=$2
SLEEP_TIME=2
if [ $# -eq 2 ] 
then
    killall -u $OLD_USER
    usermod -l $NEW_USER $OLD_USER
    groupmod -n $NEW_USER $OLD_USER
    usermod -d /home/$NEW_USER -m $NEW_USER
else
    echo "Usage: $0 <NAME OF THE OLD USER> <NAME OF THE NEW USER>"
    echo "Note: The tool has to be run with sudo permissions."
fi
