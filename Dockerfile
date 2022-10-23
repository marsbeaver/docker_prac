FROM alpine
RUN apk add alpine-conf
RUN apk add openrc
RUN setup-xorg-base; exit 0
RUN apk add xfce4 xfce4-terminal xfce4-screensaver lightdm-gtk-greeter
RUN rc-update add dbus
RUN rc-update add lightdm
RUN apk add xauth
RUN apk update
