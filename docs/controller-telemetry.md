# Onboard controller telemetry

PX4 publishes a 2 Hz MAVLink `DEBUG_FLOAT_ARRAY` named `sail_ctrl`. MAVROS's
debug-value plugin exposes it to ROS 2, and Foxglove Bridge makes that ROS topic
available to the laptop UI.

| Array index | Value | Units / encoding |
|---:|---|---|
| 0 | Jib actuator command | normalized `[-1, 1]` |
| 1 | Main actuator command | normalized `[-1, 1]` |
| 2 | Current heading | radians, east=0, counter-clockwise positive |
| 3 | Desired heading | same frame as current heading |
| 4 | Apparent wind angle | radians |
| 5 | Mode | 0 manual, 1 heading, 2 waypoint |
| 6 | Outputs enabled | 0 false, 1 true |
| 7 | At waypoint | 0 false, 1 true |

The standard PX4/MAVROS topics remain the source for GPS, attitude, RC/link
state, battery, and vehicle status. Keep this custom stream at 2 Hz on the
57,600-baud RFD900+ link. Enable `DEBUG_FLOAT_ARRAY` at 2 Hz on the telemetry
MAVLink instance during PX4 airframe/startup configuration.

In Foxglove, first confirm the MAVROS debug-float-array topic name with
`ros2 topic list | grep debug`, then add Raw Messages and Plot panels for that
topic. The exact ROS topic spelling belongs to the installed MAVROS release;
the MAVLink message and array contract above are stable.
