i3status --config ~/.i3/i3status.config | while :
do
    read line
    mpd=$(ncmpcpp --now-playing)
    echo "$mpd | $line" || exit 1
done
