#!/bin/bash

INTERFACE='wlan0'
CHECK=$(/sbin/ifconfig | grep "$INTERFACE" | tail -1)
if [ "$CHECK" = "" ]; then
    echo "wlan0 not configured <--> NOK"
    exit 1
else
    echo "***ACCESS POINT setup (hostapd)...***"
fi

AP=$(/usr/sbin/service hostapd start)
if [ "$AP" = "" ]; then
    echo "ACCESS POINT setup failed <--> NOK"
    exit 1
else
    echo "***ACCESS POINT successfully setup <--> OK***"
fi
