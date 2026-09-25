# Saildrone Ground Station

Laptop-side tooling for telemetry visualization and occasional operator input.
Nothing in this repository is required for the boat to continue operating.

## Supported platform

- Ubuntu 26.04 LTS (amd64)
- ROS 2 Lyrical Luth
- Support baseline through May 2031

Lyrical is the project's pinned ROS distribution. Dependencies and CI should not
silently track ROS Rolling.

## Data path

```text
Pixhawk 4 -> RFD900+ / MAVLink -> MAVROS -> ROS 2 -> Foxglove Bridge
```

QGroundControl may consume the same MAVLink stream through a local MAVLink
router when required.

## Layout

- `ros2_ws/src/saildrone_interfaces/`: Ground-station ROS interfaces.
- `ros2_ws/src/saildrone_telemetry/`: MAVLink telemetry normalization.
- `ros2_ws/src/saildrone_operator/`: Guarded mission and operator commands.
- `ros2_ws/src/saildrone_bringup/`: ROS launch and configuration package.
- `foxglove/`: Checked-in layouts and panel documentation.
- `config/`: MAVROS, routing, QoS, and radio configuration.
- `launch/`: Top-level launch entry points.
- `tools/`: Setup and operational helper scripts.
- `docker/` and `compose.yaml`: Reproducible ROS and telemetry runtime.

ROS packages target ROS 2 Lyrical on Ubuntu 26.04. Package manifests and launch
files will be generated as their behavior is defined.
