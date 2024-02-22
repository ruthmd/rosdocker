# This is an auto-generated Dockerfile for ros:robot
# generated from docker_images/create_ros_image.Dockerfile.em
FROM ros:noetic-robot

# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    tmux \
    vim \
    git \
    ros-noetic-robot=1.5.0-1* \
    ros-noetic-ros-tutorials \
    ros-noetic-rviz \
    ros-noetic-rqt-graph \
    ros-noetic-navigation \
    ros-noetic-perception \
    python3-catkin-tools \
    ros-noetic-rosbridge-server \
    && rm -rf /var/lib/apt/lists/*


# Copy the entrypoint script into the container
COPY ros_entrypoint.sh /ros_entrypoint.sh

# Make sure the entrypoint script is executable
RUN chmod +x /ros_entrypoint.sh

# Set the entrypoint script to be executed when the container starts
ENTRYPOINT ["/ros_entrypoint.sh"]

# By default, just start a bash shell
CMD ["bash"]
