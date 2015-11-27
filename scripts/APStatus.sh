#!/bin/bash

APSTATUS=$(/usr/sbin/service hostapd status | grep "running")
DHCPDSTATUS=$(/usr/sbin/service isc-dhcp-server status | grep "running")

if [ "$APSTATUS" = "" ] && [ "$DHCPDSTATUS" = "" ]; then
    if [ $APSTATUS = "" ]; then
        echo "AP not running <--> NOK"
    fi

    if [ $DHCPDSTATUS = ""]; then
        echo "DHCP SERVER not running <--> NOK"
    fi
else
    APNAME=$(cat /etc/hostapd/hostapd.conf | egrep ^ssid= | awk -F "=" '{print $2}')
    echo "***AP $APNAME is running <--> OK***"
fi
