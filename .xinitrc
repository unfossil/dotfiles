#!/bin/sh

setxkbmap -option terminate:ctrl_alt_bksp
xset -b # disable stupid noises
xrdb -merge $HOME/.Xresources
while true 
do
    xsetroot -name  "$(date +"%a %b %d %r")"
    sleep 1s
done &
exec dwm
