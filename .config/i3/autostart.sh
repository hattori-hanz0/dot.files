#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run picom --xrender-sync-fence --backend xrender
run sxhkd -c ~/.config/i3/sxhkdrc

# xsetroot -solid black &
# polybar example &
# nm-applet &
# dunst &
# alacritty --class alacritty,terminal &
# syncthing --no-browser &
# blueman-tray &
# run xinput set-prop 9 321 0.9

# Find out your monitor name with xrandr or arandr (save and you get this line)
# xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
# xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
# xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
# xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

# $HOME/.config/polybar/launch.sh

# change your keyboard if you need it
# setxkbmap -layout be

#Some ways to set your wallpaper besides variety or nitrogen
# feh --bg-scale ~/.config/bspwm/wall.png &
# feh --randomize --bg-fill ~/Képek/*
# feh --randomize --bg-fill ~/Dropbox/Apps/Desktoppr/*

# $HOME/bin/tapeta_set &

# xsetroot -cursor_name left_ptr &
# sxhkd &

# conky -c $HOME/.config/conky/system-overview &
# conky -c $HOME/.config/coky/shortcuts-bspwm &
# run variety &
# run nm-applet &
# run pamac-tray &
# run xfce4-power-manager &
# run ~/bin/polybar example &
# run dunst &
# sudo acpid &
# numlockx on &
# blueberry-tray &
# compton --config $HOME/.config/bspwm/compton.conf &
# picom -b --experimental-backends &
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# nitrogen --restore &
# run caffeine &
# run vivaldi-stable &
# run firefox &
# run insync start &
# run atom &

# polybar example
# xautolock -time 10 -locker blurlock
# mod+t - ~/bin/tapeta-set
# run nextcloud &
# run clipmenud &
# run st -n scratchpad &
# run st -n dropdown &
# run nemo &
# st -n dropdown &
# run xbanish &
# run redshift-gtk -l 52.284398:20.995581 &
