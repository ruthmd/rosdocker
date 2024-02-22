# rosdocker
rosimage docker with tmux


## Make sure XQuartz is installed and running
```bash
brew cask install xquartz
open -a XQuartz

## Allow connections from localhost on Xquartz terminal
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
/usr/X11/bin/xhost + $IP
```

## Build docker image
open new terminal
```bash
cd rosdocker
docker build -t . rosimage
```

# Run the Docker container with XQuartz
``` bash
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
docker run -it --name roslocal -e DISPLAY=$IP:0 rosimage
```

## Use tmux within container
```bash
tmux new -s ros
```
[Tmux Cheatsheet](https://tmuxcheatsheet.com)

This README provides instructions for setting up and running the Docker container with XQuartz support for graphical applications. It includes commands to install XQuartz, allow connections, and run the Docker container with the appropriate display settings.
