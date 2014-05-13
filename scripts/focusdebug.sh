#!/bin/bash
function ram() {
   local sum
   local items
   local app="$1"
   if [ -z "$app" ]; then
     echo "First argument - pattern to grep from processes"
   else
     sum=0
     for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
       sum=$(($i + $sum))
     done
     sum=$(echo "scale=2; $sum / 1024.0" | bc)
     if [[ $sum != "0" ]]; then
       echo "${fg[blue]}${app}${reset_color} (${fg[green]}${sum}${reset_color}MB RAM)"
     else
       echo "There are no processes with pattern  '${fg[blue]}${app}${reset_color}' are running."
     fi
   fi
}

/usr/bin/i3status --config $1 | (read line && echo $line && read line && echo $line && while :
do
	read line
	id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
	if [ x$id != x ]; then
		name=$(xprop -id $id | awk '/WM_CLASS/{$1=$2="";print}' | cut -d'"' -f2)
		name=${name//\\/\\\\}
		name=${name//\"/\\\"}
        focusram=`ram $name`
        ramdat="[{\"name\":\"focusram\",\"full_text\":\"$focusram\"},"
		dat="[{\name\":\"title\",\"full_text\":\"$name\"},"    
		echo "${line/[/$ramdat}" || exit 1
	else
		echo "$line" || exit 1
	fi
done)
