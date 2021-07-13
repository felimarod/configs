#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

### MONITOR 1
## Left bar
polybar log -c ~/.config/polybar/monitor1.ini &
polybar time -c ~/.config/polybar/monitor1.ini &
polybar secondary -c ~/.config/polybar/workspace.ini &

## Center bar
polybar primary -c ~/.config/polybar/workspace.ini &

## Right bar
polybar state -c ~/.config/polybar/monitor1.ini &
polybar menu -c ~/.config/polybar/monitor1.ini &

### MONITOR 2
## Left bar
polybar secondary -c ~/.config/polybar/monitor2.ini

## Center bar

## Right center

