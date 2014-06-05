#!/bin/bash
i3status --config ~/.i3/i3status.config | while :
do
    read line
    mpd=$(~/scripts/nowplaying.sh)
    ram=`~/scripts/ram.sh`
    echo "$mpd | $ram | $line" || exit 1
done

