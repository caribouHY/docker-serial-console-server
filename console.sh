#!/bin/sh

BUSY=`ps | grep microcom | wc -l`
if [ ! $BUSY -eq 1 ]; then
    echo "This console is occupied."
    exit 1
fi

#/bin/busybox microcom -s $SPEED $TTY_DEVICE_PATH
