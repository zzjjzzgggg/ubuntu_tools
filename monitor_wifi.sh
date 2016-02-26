#!/bin/bash

# make sure we aren't running already
what=`basename $0`
for p in `ps h -o pid -C $what`; do
    if [ $p != $$ ]; then
        exit 0
    fi
done

# source configuration
. ./wifi.conf

exec 1> /dev/null
exec 2>> $log
echo $(date) > $log

# without check_interval set, we risk a 0 sleep = busy loop
if [ ! "$check_interval" ]; then
    echo "No check interval set!" >> $log
    exit 1
fi

startWifi () {
    dhclient -v -r
    # make really sure
    killall dhclient
    iwconfig $wlan essid $essid
    dhclient -v $wlan
}

# ifconfig $eth down
# ifconfig $wlan up
# startWifi

while [ 1 ]; do
    ping -c 1 $router_ip & wait $!
    if [ $? != 0 ]; then
        echo $(date)" attempting restart..." >> $log
        startWifi
        sleep 1
    else sleep $check_interval
    fi
done
