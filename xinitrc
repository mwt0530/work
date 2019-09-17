export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export XDG_CURRENT_DESKTOP=ubuntu:GNOME
export $(dbus-launch)

exec i3
