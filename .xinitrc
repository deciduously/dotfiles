#!/bin/bash

# Load resources

xrdb -merge .Xresources

# Set up an icon tray
stalonetray &

# Fire up apps
redshift &
feh --bg-fill img/loops.jpg &
unclutter -b
xscreensaver -no-splash &

#exec --no-startup-id /usr/lib/kdeconnectd
indicator-kdeconnectd &

#if [ -x /usr/bin/wpa_gui ] ; then
#   wpa_gui &
#fi

if [ -x /usr/bin/lxqt-powermanagement ] ; then
    sleep 3
    lxqt-powermanagement &
fi

exec xmonad
