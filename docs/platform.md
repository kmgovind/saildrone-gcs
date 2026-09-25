# Supported platform

## Baseline

| Component | Selection |
|---|---|
| Operating system | Ubuntu 26.04 LTS, amd64 |
| ROS distribution | ROS 2 Lyrical Luth |
| ROS support end | May 2031 |
| Vehicle transport | MAVLink over RFD900+ |
| ROS adapter | MAVROS 2 |
| Visualization | Foxglove Bridge and Foxglove |

ROS 2 Lyrical is pinned because it provides the longest current LTS support
window. Rolling is not an acceptable production dependency.

The normal vehicle link is MAVLink rather than XRCE-DDS. If XRCE-DDS is tested
later, Lyrical requires the DDS v3-compatible client/agent combination and a PX4
firmware build configured accordingly.
