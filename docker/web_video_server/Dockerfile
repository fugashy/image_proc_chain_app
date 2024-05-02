from ros:humble


env ROS_DISTRO humble

run apt-get update && \
  apt-get install -y \
    ffmpeg \
    libopencv-dev \
    ros-$ROS_DISTRO-vision-opencv \
    ros-$ROS_DISTRO-image-transport \
    ros-$ROS_DISTRO-async-web-server-cpp

workdir /opt/web_video_server/src
run git clone --depth=1 -b ros2 https://github.com/RobotWebTools/web_video_server.git
workdir /opt/web_video_server
run bash -c "source /opt/ros/humble/setup.bash && colcon build --symlink-install"

workdir /
copy ./entrypoint.sh /
entrypoint ["/entrypoint.sh"]
