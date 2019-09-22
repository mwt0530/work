i3wm on ubuntu 18.04
---

## ubuntu&i3wm系统问题

- 移除snap
https://ubuntu-mate.community/t/how-to-completely-remove-snap/19395

- root启动gnome-terminal
https://github.com/Microsoft/WSL/issues/2016
https://ubuntuforums.org/showthread.php?t=2383992
https://blog.hugochinchilla.net/2013/03/using-gnome-3-with-i3-window-manager/
https://unix.stackexchange.com/questions/344617/error-constructing-proxy-when-trying-to-launch-gnome-terminal-as-root
https://unix.stackexchange.com/questions/407831/how-can-i-launch-gnome-terminal-remotely-on-my-headless-server-fails-to-launch

- root打开gnome-control-center
https://askubuntu.com/questions/1062713/how-can-i3-use-gnome-settings-in-ubuntu-18-04?noredirect=1
https://github.com/i3-gnome

## wechat微信

https://extendswind.top/posts/technical/deepin_wine_run_in_not_gnome_desktop_environment/
https://github.com/wszqkzqk/deepin-wine-ubuntu/issues/12
https://github.com/bestwu/docker-wechat
https://www.jishuwen.com/d/2skQ

- docker wechat X Error
https://extendswind.top/posts/technical/deepin_wine_run_in_not_gnome_desktop_environment/
https://github.com/wszqkzqk/deepin-wine-ubuntu/issues/12
https://github.com/bestwu/docker-qq

https://bbs.deepin.org/forum.php?mod=viewthread&tid=142401
- appImage wechat
http://www.justlive.vip/blog/article/details/24235


## touchpad enable click on tap
https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm/


##  xinitrc
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export LC_ALL=zh_CN.UTF-8

export XDG_CURRENT_DESKTOP=ubuntu:GNOME
export $(dbus-launch)

exec i3 -V >> i3.log 2>&1

## 屏幕亮度
https://ivan.reallusiondesign.com/i3wm-brightness-control-on-t480s/


## run .desktop files with command line
gtk-launch file (file is name without .desktop under /usr/share/applications/)
https://askubuntu.com/questions/5172/running-a-desktop-file-in-the-terminal
