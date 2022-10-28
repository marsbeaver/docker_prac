# **Implementing GUI for linux Docker containers** <br />

Dockerfile uploaded for setting up the container <br />

**Build docker file** <br />

`sudo docker build -t tag_name /Desktop/Dockerfile_folder` <br />

# **_USING Xephyr_**

**Run following on a separate terminal, a black window will show** <br />

`xhost +local:*` <br />
`Xephyr :0` <br />

**Start the container** <br />

`sudo docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix/ -v $HOME/.Xauthority:/.Xauthority --name my_container tag_name `<br />

**Start and attach the container IF already created but closed, in order to do it again** <br />

`sudo docker start my_container`  <br />
`sudo docker attach my_container`  <br />

**In the container's shell, run the following** <br />

`DISPLAY=:0 startxfce4` <br />

**ctrl+c in container shell to close** <br />
**type exit in container shell to close it** <br />

**If there is an error, close and restart Xephyr and run line 23 again** <br />

![This is how it looks](Screenshot%20from%202022-10-23%2018-15-59.png)

## **_USING x11vnc_** <br />
_update: added 'apk add xvfb' to Dockerfile_ <br />
_Connect remotely to another device_ <br />

Install vnc viewer in another device. <br />

**Use below command to create container instead** <br />
  `sudo docker run -it --net=host --name my_container tag_name` <br />

**Make sure the host machine allows 5900 in its firewall** <br />
`sudo ufw enable` <br />
`sudo ufw allow 5900` <br />

If the vnc viewer doesn't detect the system, reset the firewall, enable and allow 5900 again <br />
`sudo ufw reset` <br />
`sudo ufw enable` <br />
`sudo ufw allow 5900` <br />

In container, run: <br />
  `x11vnc -storepasswd` <br />
  `x11vnc -create -env FD_PROG=/usr/bin/startxfce4 -shared -rfbauth /path/where/pass/was/stored/in/above/command/result` <br />
 

 
In the vnc viewer, enter ip address of your main system, not the container. <br />

![This is how it looks](android_vnc.png)

![This is how it looks](android_vnc2.png)

## **_USING novnc_** <br />
Connect to docker container through browser using novnc <br />

_update_:Added 'RUN apk add git', 'RUN apk add bash', and 'RUN apk add python3' in Dockerfile

Download [novnc](https://github.com/novnc/noVNC/releases) <br />

**Use below command to create container instead** <br />
  `sudo docker run -it --net=host -v /path/of/novnc/folder:/path/for/novnc/folder --name my_container tag_name` <br />

In container, run: <br />
    `x11vnc -storepasswd` <br />
    `x11vnc -create -env FD_PROG=/usr/bin/startxfce4 -shared -rfbauth /path/where/pass/was/stored/in/above/command/result` <br />

Execute another terminal in container <br />

`sudo docker exec -it my_container /bin/sh` <br />

Run following in this terminal <br />

`./utils/novnc_proxy --vnc localhost:5900` <br />

Go to remote system's browser and enter the url given by above command's output <br />
Replace the host-name(e.g pop-os) with system's public IP address <br />
http://pop-os:6080/vnc.html?host=pop-os&port=6080 <br />
Click connect <br />

![This is how it looks!](novnc_browser.png) <br />

![This is how it looks!](novnc_xfce4.png) <br />

Docker image for novnc implementation: <br />

`docker pull marsbeaver/gui_imp:latest` <br />

Create and run container: <br />

`docker run -it -p 6080:6080 --name my_container marsbeaver/gui_imp:latest`

In the container's terminal, run: <br />

`./usr/bin/abcd.sh` <br />










