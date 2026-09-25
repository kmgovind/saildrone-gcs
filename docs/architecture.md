# Architecture

The GCS is an optional observer and source of guarded, low-rate commands.
MAVLink from the RFD900+ is routed to MAVROS and optionally QGroundControl.
MAVROS exposes ROS 2 topics, which Foxglove Bridge serves locally to Foxglove.

The onboard controller owns continuous control, mode authority, actuator limits,
and loss-of-link behavior.
