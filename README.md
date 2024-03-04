# rosdocker
rosimage docker with tmux

## Build docker image
open new terminal
```bash
cd rosdocker
docker-compose up --build
```
## Running RViz
1. Run `docker-compose exec ros bash` (`docker-compose up` has to be running)
2. Run `cd ~/catkin_ws && catkin_make && source devel/setup.bash`
3. Run `rosrun rviz rviz`
4. Open your browser to `localhost:8080/vnc.html` and click connect.
5. RViz is now running in your browser.

## Use tmux within container
```bash
tmux new -s ros
```
[Tmux Cheatsheet](https://tmuxcheatsheet.com)

Inspired from [mac-ros](https://github.com/nebohq/mac-ros/)
