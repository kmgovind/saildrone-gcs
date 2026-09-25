#!/usr/bin/env bash
set -e

source /opt/ros/lyrical/setup.bash

if [[ -f /opt/saildrone_ws/install/setup.bash ]]; then
  source /opt/saildrone_ws/install/setup.bash
fi

exec "$@"
