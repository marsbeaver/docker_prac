FROM alpine
RUN apk add alpine-conf xfce4 xfce4-terminal xfce4-screensaver lightdm-gtk-greeter x11vnc git bash python3 xvfb && apk update
RUN echo "done all"
