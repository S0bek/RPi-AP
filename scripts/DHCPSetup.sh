#!/bin/bash

INTERFACE='wlan0'
ACTIVE=$(/sbin/ifconfig | grep $INTERFACE | tail -1)

if [ "$ACTIVE" = "" ]; then
    echo "Interface $INTERFACE inactive <--> NOK"
else
    echo "***Interface $INTERFACE active <--> OK***"
    STATUS=$(service isc-dhcp-server status | grep "not running")

    if [ "$STATUS" = "" ]; then
        echo "***DHCP SERVER running <--> OK***"
    else
        echo "DHCP SERVER not running"
        echo "DHCP SETUP for $INTERFACE..."
        STATUS=$(service isc-dhcp-server start)

        if [ $STATUS != 0 ]; then
            echo "***DHCP successfully started <--> OK***"
        else
            echo "DHCP failed during startup <--> NOK"
        fi
    fi

fi

