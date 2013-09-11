pulseaudio --start &
#xrandr --output DVI-I-1 --right-of DP-1 &
xset -b &
xsetroot -cursor_name left_ptr &
xsettingsd &
#xmodmap -e "remove Mod1 = Alt_R"
#xmodmap -e "add Mod5 = Alt_R"
/home/corin/Bin/wallpaper &
exec i3
