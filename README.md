**docker_prac**
Practicing docker:Gui linux container

Uploading Dockerfile for setting up the container


**Build docker file**

sudo docker build -t tag_name /Desktop/Dockerfile_folder

**Run following on a separate terminal, a black window will show**

xhost +local:*
Xephyr :0

**Start the container**

sudo docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix/ -v $HOME/.Xauthority:/.Xauthority --name my_container tag_name

**Start and attach the container IF already created but closed, in order to do it again**

sudo docker start my_container  
sudo docker attach my_container

**In the container's shell, run the following**
**if it says startxfce4 not found, run 'apk add xfce4' in the shell**

DISPLAY=:0 startxfce4

**ctrl+c in container shell to close**
**type exit in container shell to close it**

**If there is an error, close and restart Xephyr and run line 23 again**




