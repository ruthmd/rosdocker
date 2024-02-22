#!/bin/bash

# Source the ROS setup script
source /opt/ros/noetic/setup.bash

# Set the path to the Catkin workspace
CATKIN_WS=~/catkin_ws

# Check if the Catkin workspace exists, if not, create it
if [ ! -d "$CATKIN_WS/src" ]; then
    echo "Creating Catkin workspace at $CATKIN_WS"
    mkdir -p $CATKIN_WS/src
    cd $CATKIN_WS/src
    catkin_init_workspace
    cd $CATKIN_WS
    catkin_make
fi

# Source the setup script of the Catkin workspace
source "$CATKIN_WS/devel/setup.bash"

# Clone MoveIt and related repositories into the Catkin workspace
cd $CATKIN_WS/src
wstool init .
wstool merge -t . https://raw.githubusercontent.com/ros-planning/moveit/master/moveit.rosinstall
wstool remove moveit_tutorials
wstool update -t .

git clone https://github.com/ros-planning/moveit_tutorials.git -b master

# Remove panda_moveit_config directory if it exists
if [ -d "panda_moveit_config" ]; then
    echo "Removing existing panda_moveit_config directory"
    rm -rf panda_moveit_config
fi

git clone https://github.com/ros-planning/panda_moveit_config.git -b noetic-devel

# Update rosdep database
rosdep update

# Install dependencies
rosdep install --from-paths . --ignore-src -r -y

# Build the Catkin workspace
cd $CATKIN_WS
# catkin_make
