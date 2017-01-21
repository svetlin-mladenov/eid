#!/bin/bash

set -e

docker build -t eid .

DEVICES=`lsusb | awk -v ORS=" " -F'[ :]' '{ print "--device /dev/bus/usb/" $2 "/" $4 }'`

docker run -it --rm --name eid $DEVICES --env DISPLAY=$DISPLAY -v ~/.Xauthority:/root/.Xauthority -v /tmp/.X11-unix:/tmp/.X11-unix --net host eid $@
