sleep 3 && sbxkb &
feh --bg-scale  ~/wallpaper.jpg &
setxkbmap -layout us,ru -variant -option grp:caps_toggle,grp_led:scroll,terminate:ctrl_alt_bksp &
tint2 &
python3 mocp-scrobbler.py -d &
urxvtd --quiet --opendisplay --fork &
conky -x 0 -y 0 &
/home/constantine/netbeans-8.0/bin/netbeans &
skype &
firefox-bin &

#!/bin/sh
do_wallpaper ( ) {
    local x
    x=1
    while [ "x$x" = "x1" ]
    do
        which "$1"||x=0
        urxvt -name urxvt-wallpaper-$1 -j -ss -g $3 -fg black -fn "xft:Inconsolata:size=9" -fb  "xft:Inconsolata:size=10:style=bold:antalias=true:hintig=slight" -transparent -tintColor white +sb -bl -e "$2" || x=0
        echo $x
    done
}
do_wallpaper mocp htop 110x26&


