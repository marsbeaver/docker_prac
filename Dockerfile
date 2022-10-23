FROM alpine
RUN apk add alpine-conf &&\
 apk add openrc &&\
 setup-xorg-base; exit 0 &&\
 apk add xfce4 xfce4-terminal xfce4-screensaver lightdm-gtk-greeter &&\
 rc-update add dbus &&\
 rc-update add lightdm &&\
 apk add xauth &&\
 apk update
RUN echo "done"
