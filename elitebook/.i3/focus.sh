#!/bin/bash
/usr/bin/i3status --config $1 | (read line && echo $line && read line && echo $line && while :
do
	read line
        mpd=`~/scripts/nowplaying.sh`
	id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
	if [ x$id != x ]; then
		name=$(xprop -id $id | awk '/WM_CLASS/{$1=$2="";print}' | cut -d'"' -f2)
		name=${name//\\/\\\\}
		name=${name//\"/\\\"}
		dat="[{\"name\":\"title\",\"full_text\":\"$mpd | $name\"},"
		echo "${line/[/$dat}" || exit 1
	else
		echo "$line" || exit 1
	fi
done)
