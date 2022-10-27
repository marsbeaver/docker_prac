# **Implementing GUI for linux Docker containers** <br />

Dockerfile uploaded for setting up the container <br />

**Build docker file** <br />

`sudo docker build -t tag_name /Desktop/Dockerfile_folder` <br />

**Run following on a separate terminal, a black window will show** <br />

`xhost +local:*` <br />
`Xephyr :0` <br />

**Start the container** <br />

`sudo docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix/ -v $HOME/.Xauthority:/.Xauthority --name my_container tag_name `<br />

**Start and attach the container IF already created but closed, in order to do it again** <br />

`sudo docker start my_container`  <br />
`sudo docker attach my_container`  <br />

**In the container's shell, run the following** <br />
**if it says startxfce4 not found, run `apk add xfce4` in the shell** <br />

`DISPLAY=:0 startxfce4` <br />

**ctrl+c in container shell to close** <br />
**type exit in container shell to close it** <br />

**If there is an error, close and restart Xephyr and run line 23 again** <br />

![This is how it looks](Screenshot%20from%202022-10-23%2018-15-59.png)

## **_USING x11vnc_** <br />
_update: added 'apk add fluxbox xvfb xterm' to Dockerfile_ <br />
_Connect remotely to another device_ <br />

Install vnc viewer in another device. <br />

**Use below command to create container instead** <br />
  `sudo docker run -it -p --net=host --name my_container tag_name` <br />

**Make sure the host machine allows 5900 in its firewall** <br />

In container, run: <br />
  `x11vnc -storepasswd` <br />
  `x11vnc -create -env FD_PROG=/usr/bin/fluxbox -shared -rfbauth /path/where/pass/was/stored/in/above/command/result` <br />
 
In the vnc viewer, enter ip address of your main system, not the container. <br />

In the device, right click + xterm. <br />
In the terminal, type: <br />
  `startxfce4` <br />


## **_USING novnc_** <br />
Connect to docker container through browser using novnc <br />

_update_:Added 'RUN apk add git', 'RUN apk add bash', and 'RUN apk add python3' in Dockerfile

Download [novnc](https://github.com/novnc/noVNC/releases) <br />

In container, run: <br />
    `x11vnc -storepasswd` <br />
    `x11vnc -create -env FD_PROG=/usr/bin/fluxbox -shared -rfbauth /path/where/pass/was/stored/in/above/command/result` <br />

In a new terminal of host system<br />
`cd /path/to/extracted/noVNC_folder`

Execute following in that terminal <br />

`./utils/novnc_proxy --vnc localhost:5900` <br />

Go to remote system's browser and enter the url given by above command's output <br />
Replace the host-name(e.g pop-os) with system's public IP address <br />
http://pop-os:6080/vnc.html?host=pop-os&port=6080 <br />
Click connect <br />

![This is how it looks!](novnc_browser.png) <br />

![This is how it looks!](novnc_fluxbox.png) <br />

![This is how it looks!](novnc_xfce4.png) <br />










