#!/bin/bash

# Load resources

xrdb -merge .Xresources

# Set up an icon tray
stalonetray &

# Fire up apps
redshift &
feh --bg-fill img/naturewarm.jpg &
xscreensaver -no-splash &

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

if [ -x /usr/bin/lxqt-powermanagement ] ; then
    sleep 3
    lxqt-powermanagement &
fi

exec xmonad
