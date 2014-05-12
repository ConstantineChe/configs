#!/bin/sh
# Display an OSD of the current track
COLOR="#495D94"
FONT="-bitstream-charter-bold-r-*-*-*-250-*-*-*-*-*-*"
track ()
{
      artist=`mpc -f [[[%name%]%artist%]] current`
      title=`mpc -f [[%title%]] current`
      position=`mpc -f [%time%] | grep "pl" | awk '{print $4 }'`
      echo "$artist - $title $position"
}
echo -e "Playing: "`track`" "
