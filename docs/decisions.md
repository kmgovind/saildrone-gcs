# Baseline decisions

## Supported system

- Ubuntu 26.04 LTS on amd64
- ROS 2 Lyrical Luth, supported through May 2031
- ROS packages are installed from the Lyrical repositories
- Production code must not depend on ROS Rolling

## Vehicle link

The production data path is:

```text
Pixhawk 4 -> RFD900+ -> MAVLink router -> MAVROS 2 -> ROS 2 -> Foxglove Bridge
```

The MAVLink router may fan out the serial connection to MAVROS and
QGroundControl. Only one process should own the physical RFD900+ serial device.

## Ground-station authority

The GCS is optional and is primarily for visualization, logging, mission
management, and occasional guarded inputs. It does not run the continuous
controller or path planner and does not decide manual/autonomous authority.

## Dependency policy

ROS patch releases and compatible package updates within Lyrical are accepted so
the system continues receiving fixes. The ROS distribution, operating-system
release, MAVLink transport, and message contracts are changed only through an
explicit compatibility update.
