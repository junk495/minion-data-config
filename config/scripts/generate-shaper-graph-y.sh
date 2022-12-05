#!/bin/bash

NEWY=$(ls -Art /tmp/resonances_y_*.csv | tail -n 1)
DATE=$(date +'%Y-%m-%d-%H%M%S')
if [ ! -d "/home/pi/Minion-data/input_shaper" ]
then
    mkdir /home/pi/Minion-data/input_shaper
    chown pi:pi /home/pi/Minion-data/input_shaper
fi

~/klipper/scripts/calibrate_shaper.py $NEWY -o /home/pi/klipper_config/input_shaper/resonances_y_$DATE.png
