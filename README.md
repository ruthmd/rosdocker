# rosdocker
rosimage docker with tmux

## Build docker image
```bash
cd rosdocker
docker build -t . rosimage
```

## run image
```bash
docker run -it  --name roslocal rosimage
```

## Use tmux within container
```bash
tmux new -s ros
```
[Tmux Cheatsheet](https://tmuxcheatsheet.com)

