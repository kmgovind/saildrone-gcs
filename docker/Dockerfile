FROM ros:lyrical-ros-base-resolute

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
      geographiclib-tools \
      ros-lyrical-foxglove-bridge \
      ros-lyrical-mavros \
      ros-lyrical-mavros-extras && \
    rm -rf /var/lib/apt/lists/*

RUN /opt/ros/lyrical/lib/mavros/install_geographiclib_datasets.sh

WORKDIR /opt/saildrone_ws
COPY ros2_ws/src src
RUN . /opt/ros/lyrical/setup.sh && colcon build --symlink-install

COPY docker/ros-entrypoint.sh /ros-entrypoint.sh
ENTRYPOINT ["/ros-entrypoint.sh"]
CMD ["bash"]
