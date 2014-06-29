if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

### DWM BAR CONFIG
### BEGIN BAR
while xsetroot -name "$(free -m | awk '/cache:/ { print $3"MB" }')  Vol:$(amixer get Master | tail -1 | awk '{ print $5 }' | tr -d '[]')  Batt:$(acpi | awk '{print $4 }' | tr -d ',')  $(date +%R)"
    do
        sleep 1
    done &

### DWM END BAR


#### BSPWM STUFF

#if [ "$DEFAULT_SESSION" = "bspwm" ] ; then
#    xrdb -load $HOME/.Xresources
#    sxhkd -c $HOME/.config/sxhkd/sxhkdrc &
#    exec bspwm
#fi

#export PANEL_FIFO=/tmp/panel-fifo
#
#sxhkd &
##[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
##mkfifo "$PANEL_FIFO"
#exec bspwm -s "$PANEL_FIFO" -p W

## END BSPWM

# German - might not work :S
setxkbmap de_latin1_nodeadkeus

### Trackpoint
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Timeout" 50

# Turns off the system bell
/usr/bin/xset b off &

# Set Xresources to be sourced
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local/

### STARTUP - if an WM like i3 does not do it
exec wicd-gtk --tray &
exec dropboxd &
exec nitrogen --restore &

### EXEC
#exec startkde
#sxhkd &
#exec bspwm
#exec startlxde
#exec i3
#exec startxfce4
exec dwm
