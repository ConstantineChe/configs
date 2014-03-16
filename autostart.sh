feh --bg-scale  ~/wallpapers/les_discrets.jpg &
setxkbmap -layout us,ru -variant -option  grp:caps_toggle,grp_led:scroll,terminate:ctrl_alt_bksp &
tint2 &
python3 mocp-scrobbler.py -d &
urxvtd --quiet --opendisplay --fork &
conky -x 0 -y 0 &

#!/bin/sh
do_wallpaper ( ) {
    local x
    x=1
    while [ "x$x" = "x1" ]
    do
        which "$1"||x=0
        urxvt -name urxvt-wallpaper-$1 -j -ss -g $3 -fn "xft:Inconsolata:size=9" -fb "xft:Inconsolata:size=10:style=bold:antalias=true:hintig=slight"  -transparent -tintColor white +sb -bl -e "$2" || x=0
        echo $x
    done
}
do_wallpaper mocp mocp 125x26&
do_wallpaper bash bash 202x29&

