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

if [ -x /usr/bin/gpg-agent ]; then
  eval "$(/usr/bin/gpg-agent --daemon)"
fi

if [-n "${GPG_AGENT_INFO}" ]; then
  kill $(echo ${GPG_AGENT_INFO} | cut -d':' -f 2) >/dev/null 2>&1
fi
exec xmonad
