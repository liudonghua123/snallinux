RESOLUTION=`xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/'`
nice -n 10 convert -gravity center -background black -resize $RESOLUTION -extent $RESOLUTION .snal_lock_orig.png .snal_lock.png &

exec i3
#exec startxfce4
